import 'package:bloc_ftu/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/main/wf_details_repository.dart';
import '../../../theme/app_text_style.dart';
import '../../../theme/app_theme.dart';
import '../bloc/wf_details_bloc.dart';
import '../widgets/main_details_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const Scaffold(
        body: Scaffold(
          body: WeatherForecast(),
        ),
      ),
    );
  }
}

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  final _wfDetailsBloc = WFDetailsBloc(GetIt.instance<WFDetailsRepository>());


  @override
  void initState() {
    _wfDetailsBloc.add(LoadWFDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WFDetailsBloc, WFDetailsState>(
      bloc: _wfDetailsBloc,
      builder: (context, state) {
        if (state is WFDetailsLoadedState) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.wfDetails.name,
                      style: AppTextStyle.defaultRegularLargeTitle
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${state.wfDetails.main.temp.toStringAsFixed(0).toString()}\u00B0',
                          style: AppTextStyle.defaultSemiBoldTitle3
                              .copyWith(color: Colors.white24),
                          maxLines: 1,
                        ),
                        Text(
                          ' | ',
                          style: AppTextStyle.defaultSemiBoldTitle3
                              .copyWith(color: Colors.white24),
                        ),
                        Text(
                          state.wfDetails.weather.first.description.toString(),
                          style: AppTextStyle.defaultSemiBoldTitle3
                              .copyWith(color: Colors.white24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 400),
              SizedBox(
                height: 80,
                // width: 200,
                child: FittedBox(
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 4,
                        color: Color(0xFF5B5F78),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainDetailsWidget(),
                        ),
                      );
                    },
                    label: const Text('DetailsWidget'),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is WFDetailsLoadingFailureState) {
          // return Center(
          //     child: Text(state.exception?.toString() ?? 'Exception'));
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Something went wrong',
                  style: AppTextStyle.defaultBoldLargeTitle,
                ),
                const SizedBox(height: 12),
                Text(
                  'Please try again later',
                  style: AppTextStyle.defaultRegularTitle3.copyWith(
                      color: AppColors.linearWhiteParametersButtonShort2),
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () {
                    _wfDetailsBloc.add(LoadWFDetailsEvent());
                  },
                  child: Text(
                    'Try again',
                    style: AppTextStyle.defaultRegularTitle3
                        .copyWith(color: AppColors.indicatorsWarningDark),
                  ),
                )
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

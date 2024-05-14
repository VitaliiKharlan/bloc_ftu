import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../theme/app_text_style.dart';
import '../../details/bloc/details_of_wf_bloc.dart';

class MainDetailsWidget extends StatelessWidget {
  const MainDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = DetailsOfWFBloc()..add(LoadDetailsOfWFEvent());

    return BlocProvider<DetailsOfWFBloc>(
      create: (context) => bloc,
      child: BlocBuilder<DetailsOfWFBloc, DetailsOfWFState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is DetailsOfWFLoadedState) {
            final cityName = state.detailsOfWF.name.toString();
            final currentTemp =
                state.detailsOfWF.main.temp.toStringAsFixed(0).toString();
            final description =
                state.detailsOfWF.weather.first.description.toString();
            final descriptionFirstUp = toBeginningOfSentenceCase(description);

            return Scaffold(
              backgroundColor: const Color(0xFF2E335A),
              appBar: AppBar(
                backgroundColor: const Color(0xFF2E335A),
              ),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cityName,
                      style: AppTextStyle.defaultRegularLargeTitle
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$currentTemp\u00B0",
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
                          '$descriptionFirstUp',
                          style: AppTextStyle.defaultSemiBoldTitle3
                              .copyWith(color: Colors.white24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

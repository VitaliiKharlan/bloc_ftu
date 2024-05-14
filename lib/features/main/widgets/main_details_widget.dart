import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.detailsOfWF.name.toString(),
                      style: AppTextStyle.defaultRegularLargeTitle
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Montreal',
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
                          'Montreal',
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
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

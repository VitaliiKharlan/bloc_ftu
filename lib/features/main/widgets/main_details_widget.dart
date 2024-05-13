import 'package:flutter/material.dart';

import '../../../theme/app_text_style.dart';

class MainDetailsWidget extends StatelessWidget {
  const MainDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Montreal',
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
    );
  }
}

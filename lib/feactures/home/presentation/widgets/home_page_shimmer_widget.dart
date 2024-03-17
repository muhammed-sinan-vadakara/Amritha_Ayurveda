import 'package:flutter/material.dart';
import 'package:amritha_ayurveda/core/themes/app_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spaces.space_300,
          ),
          child: Container(
            height: AppTheme.of(context).spaces.space_500 * 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                spaces.space_50,
              ),
              color: color.secondary,
              // boxShadow: [AppTheme.of(context).boxShadow.secondary],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: spaces.space_200,
                  top: spaces.space_200,
                  right: spaces.space_200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: color.textInverse,
                    highlightColor: color.textSubtle,
                    child: Container(
                      height: spaces.space_500 * 4,
                      decoration: BoxDecoration(
                        color: color.textSubtle,
                        borderRadius: BorderRadius.circular(
                          spaces.space_100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spaces.space_100,
                  ),
                  Shimmer.fromColors(
                    baseColor: color.textInverse,
                    highlightColor: color.textSubtle,
                    child: Container(
                      height: spaces.space_500 * 4,
                      decoration: BoxDecoration(
                        color: color.textSubtle,
                        borderRadius: BorderRadius.circular(
                          spaces.space_100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spaces.space_100,
                  ),
                  Shimmer.fromColors(
                    baseColor: color.textInverse,
                    highlightColor: color.textSubtle,
                    child: Container(
                      height: spaces.space_500 * 4,
                      decoration: BoxDecoration(
                        color: color.textSubtle,
                        borderRadius: BorderRadius.circular(
                          spaces.space_100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: spaces.space_400,
        ),
      ],
    );
  }
}

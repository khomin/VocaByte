import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

class HomeCardItem extends StatelessWidget {
  const HomeCardItem({
    required this.header,
    required this.description,
    required this.width,
    required this.asset,
    required this.canTap,
    required this.onTap,
    this.iconBackground,
    this.margin,
    this.height,
    super.key,
  });
  final String header;
  final String description;
  final double width;
  final String asset;
  final bool Function() canTap;
  final Function() onTap;
  final Color? iconBackground;
  final EdgeInsets? margin;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return RoundButton(
        color: Theme.of(context).colorScheme.cardHome,
        radius: 25,
        useShadow: true,
        useScaleAnimation: false,
        height: height ?? Constants.homeCardHeight,
        margin: margin ??
            const EdgeInsets.only(
              left: Constants.homeCardPadding,
              right: Constants.homeCardPadding,
              bottom: 16,
            ),
        width: width,
        onPressed: (_) {
          if (canTap()) {
            onTap();
          }
        },
        child: IgnorePointer(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 14,
              ),
              child: Row(children: [
                Stack(children: [
                  if (iconBackground != null)
                    Center(
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: iconBackground,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: iconBackground != null ? 40 : 8),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                header,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: Constants.fontInter,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                  color:
                                      Theme.of(context).colorScheme.homeCardH1,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 8),
                            Text(
                              description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.5,
                                fontFamily: Constants.fontFredoka,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.homeCardH1,
                              ),
                            ),
                          ]))
                ])
              ]),
            ),
            Positioned(
              top: -0,
              bottom: 0,
              right: 0,
              child: SizedBox(
                  width: 85,
                  child: Stack(children: [
                    Center(
                        child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Image.asset(
                        asset,
                      ),
                    ))
                  ])),
            ),
          ]),
        ));
  }
}

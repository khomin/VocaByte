import 'dart:async';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/repository/payment_service.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/tts.dart';

class UpgradeFull extends StatefulWidget {
  const UpgradeFull({
    required this.limitReached,
    required this.withHeader,
    super.key,
  });
  final bool limitReached;
  final bool withHeader;

  @override
  UpgradeFullState createState() => UpgradeFullState();
}

class UpgradeFullState extends State<UpgradeFull>
    with TickerProviderStateMixin {
  var _busy = false;
  late AnimationController _scaleController;
  late AnimationController _shakeControlller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  final _dispStream = DisposableStream();
  final tag = 'upgradeFull';

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Constants.animDurationLong);

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _scaleController.view,
        curve: const Interval(0.00, 0.50, curve: Curves.easeInOut)));

    _shakeControlller = AnimationController(
      duration: Constants.animDurationLong,
      vsync: this,
    );

    _rotateAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 0.005), weight: 1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.005, end: 0), weight: 1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: -0.005), weight: 1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: -0.005, end: 0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _shakeControlller.view,
      curve: Curves.linear,
    ));

    Future.delayed(const Duration(milliseconds: 100), () {
      _scaleController.forward(from: 0.0);
      _shakeControlller.forward();
    });
  }

  @override
  void dispose() {
    TextToSpeach().stop();
    _dispStream.dispose();
    _scaleController.dispose();
    _shakeControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.baseColor1,
        body:
            CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
          if (widget.withHeader)
            SliverAppBar(
                floating: true,
                primary: false,
                expandedHeight: Constants.homeAppBarHeight + padding.top,
                collapsedHeight: Constants.homeAppBarHeight + padding.top,
                toolbarHeight: Constants.homeAppBarHeight + padding.top,
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                titleSpacing: 0,
                title: Container(
                  alignment: Alignment.center,
                  child: Material(
                    color: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: Container(
                      padding: EdgeInsets.only(top: padding.top),
                      height: Constants.homeAppBarHeight + padding.top,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.appBar,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(0, -2),
                            ),
                          ]),
                      child: _buildTopBar(),
                    ),
                  ),
                )),
          SliverFillRemaining(
            child: _body(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).padding.bottom),
          ),
        ]));
  }

  Widget _buildTopBar() {
    return Stack(alignment: AlignmentGeometry.center, children: [
      Row(children: [
        Container(
          height: Constants.baseButton,
          width: Constants.baseButton,
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: RoundButton(
              color: Theme.of(context).colorScheme.roundButton,
              height: Constants.baseButton,
              width: Constants.baseButton,
              iconData: Icons.close,
              padding: const EdgeInsets.only(left: 5),
              iconSize: 22,
              radius: 20,
              onPressed: (_) {
                Navigator.of(context).pop();
              }),
        ),
      ]),
      Center(
          child: Text(
        'Upgrade',
        style: TextStyle(
          color: Theme.of(context).colorScheme.iconColor,
          fontSize: 16,
        ),
      )),
    ]);
  }

  Widget _body() {
    return AnimatedBuilder(
        animation: _scaleController,
        builder: (context, child) {
          return RotationTransition(
              turns: _rotateAnimation,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //
                    widget.limitReached
                        ? ScaleTransition(
                            scale: _scaleAnimation,
                            child: StreamBuilder(
                                stream: getIt<PaymentService>().priceStream,
                                builder: (context, snapshot) {
                                  var v = snapshot.data;
                                  if (v == null) {
                                    return const SizedBox();
                                  }
                                  return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Daily Limit Reached\n"
                                          "Free mode allows ${Constants.freeLimit} words per day\nUpgrade once\nTo remove all limits forever\n",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 10,
                                          style: Theme.of(context)
                                              .colorScheme
                                              .getBeautifulLine1(context),
                                        ),
                                        Text(
                                          "[Unlock Pro for $v]",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 10,
                                          style: Theme.of(context)
                                              .colorScheme
                                              .getBeautifulLine1(context),
                                        )
                                      ]);
                                }))
                        :
                        //
                        ScaleTransition(
                            scale: _scaleAnimation,
                            child: StreamBuilder(
                                stream: getIt<PaymentService>().priceStream,
                                builder: (context, snapshot) {
                                  var v = snapshot.data;
                                  if (v == null) {
                                    return const SizedBox();
                                  }
                                  return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '$v\nOne-time payment\nPay once. Use for life.',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .colorScheme
                                              .getBeautifulLine1(context),
                                        )
                                      ]);
                                })),
                    //
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Spacer(),
                      Flexible(
                        child: RoundButton(
                            color: Theme.of(context).colorScheme.buttonOption1,
                            iconColor: Theme.of(context)
                                .colorScheme
                                .button3TextInversed,
                            height: 50,
                            useScaleAnimation: true,
                            useShadow: true,
                            margin: const EdgeInsets.only(top: 50),
                            child: Center(
                                child: IgnorePointer(
                                    child: Text(
                              'Upgrade',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .button3TextInversed,
                                fontFamily: Constants.fontFredoka,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ))),
                            onPressed: (p0) async {
                              if (_busy) return;
                              _busy = true;
                              if (_shakeControlller.isForwardOrCompleted) {
                                _shakeControlller.reverse().orCancel;
                              } else {
                                _shakeControlller.forward().orCancel;
                              }
                              var res = await getIt<PaymentService>()
                                  .processPremium();
                              _busy = false;
                              if (context.mounted) {
                                if (res) {
                                  UiHelper.showToast(context, 'Success');
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                }
                              }
                            }),
                      ),
                      const Spacer(),
                    ]),
                  ]));
        });
  }
}

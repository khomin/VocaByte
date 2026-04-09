import 'package:provider/provider.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/components/dialogs/confirm_panel.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/models/wizard_model.dart';
import 'package:vocabyte/pages/home/home_card_item.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/service_api.dart';

class WizardMain extends StatefulWidget {
  const WizardMain({super.key});

  @override
  WizardMainState createState() => WizardMainState();
}

class WizardMainState extends State<WizardMain> {
  final _model = WizardModel();
  final _dispStream = DisposableStream();
  final tag = 'wizardMain';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _model.dispose();
    _dispStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.baseColor1,
        body: ChangeNotifierProvider.value(
            value: _model,
            builder: (context, child) {
              return CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                        floating: true,
                        primary: false,
                        expandedHeight:
                            Constants.homeAppBarHeight + padding.top,
                        collapsedHeight:
                            Constants.homeAppBarHeight + padding.top,
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
                                      color:
                                          Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(0, -2),
                                    ),
                                  ]),
                              child: _buildTopBar(),
                            ),
                          ),
                        )),
                    StreamBuilder(
                      stream: getIt<AppRep>().onWizardList,
                      initialData: getIt<AppRep>().onWizardList.valueOrNull,
                      builder: (context, snapshot) {
                        var v = snapshot.data;
                        if (v == null) {
                          return const SliverFillRemaining();
                        }
                        var keys = v.keys.toList();
                        return SliverList.builder(
                            itemCount: keys.length,
                            itemBuilder: (context, index) {
                              var key = keys[index];
                              var i = v[key];
                              var length = i['list'].length;
                              return HomeCardItem(
                                header: i['description'],
                                description: '${i["name"]}\n$length words',
                                iconBackground: null,
                                width: size.width - Constants.homeCardPadding,
                                asset: 'assets/book.png',
                                height: 100,
                                margin: const EdgeInsets.only(
                                  top: 16,
                                  left: Constants.homeCardPadding,
                                  right: Constants.homeCardPadding,
                                ),
                                canTap: () => true,
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      barrierColor: Colors.transparent,
                                      builder: (BuildContext contextSheet) {
                                        return ConfirmPanel(
                                          title: 'Are you sure?',
                                          text: 'You will import $length words',
                                          iconNo:
                                              Icons.add_circle_outline_sharp,
                                          iconOk: Icons.close,
                                          leftButtonColor:
                                              Theme.of(contextSheet)
                                                  .colorScheme
                                                  .manageCardPastel,
                                          onOk: () async {
                                            Navigator.of(contextSheet).pop();
                                            await ServiceApi()
                                                .importWords(words: i['list']);
                                            if (context.mounted) {
                                              UiHelper.showToast(
                                                  context, 'Completed');
                                            }
                                            getIt<AppRep>()
                                                .refreshWordToLearn();
                                            getIt<AppRep>().refreshManageList();
                                          },
                                        );
                                      });
                                },
                              );
                            });
                      },
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                          height: MediaQuery.of(context).padding.bottom),
                    ),
                  ]);
            }));
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
        'Library',
        style: TextStyle(
          color: Theme.of(context).colorScheme.iconColor,
          fontSize: 16,
        ),
      )),
    ]);
  }
}

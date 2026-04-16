import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/components/dialogs/confirm_panel.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/app_runner.dart';
import 'package:vocabyte/models/settings_model.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/services/service_api.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({required this.model, super.key});
  final SettingsModel model;

  @override
  State<SettingsProfile> createState() => SettingsProfileState();
}

class SettingsProfileState extends State<SettingsProfile> {
  final tag = 'settingsProfile';

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.baseColor1,
        body: ChangeNotifierProvider.value(
            value: widget.model,
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
                    SliverToBoxAdapter(
                      child: _importWords(),
                    ),
                    SliverToBoxAdapter(
                      child: _exportWords(),
                    ),
                    SliverToBoxAdapter(
                      child: _exportProfile(),
                    ),
                    SliverToBoxAdapter(
                      child: _importProfile(),
                    ),
                    SliverToBoxAdapter(
                      child: _deleteProfile(),
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
        'Profile',
        style: TextStyle(
          color: Theme.of(context).colorScheme.iconColor,
          fontSize: 16,
        ),
      )),
    ]);
  }

  Widget _importWords() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return _view(
          header: 'Import words',
          comment: 'Choose a file to import from',
          icon: Icons.unarchive_rounded,
          busy: model.importBusy,
          setBusy: (v) {
            model.importBusy = v;
            model.notify();
          },
          doTask: () async {
            var count = await ServiceApi().importWords();
            if (count > 0) {
              getIt<AppRep>().refreshWordToLearn();
              getIt<AppRep>().refreshManageList();
              if (context.mounted) {
                UiHelper.showToast(context, 'Imported $count');
              }
            }
            return true;
          });
    });
  }

  Widget _exportWords() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return _view(
        header: 'Export words',
        comment: 'To use them on another device',
        icon: Icons.archive_rounded,
        busy: model.exportBusy,
        setBusy: (v) {
          model.exportBusy = v;
          model.notify();
        },
        doTask: () async {
          var res = await ServiceApi().exportWords();
          if (context.mounted && res) {
            UiHelper.showToast(context, 'Exported');
          }
          return res;
        },
      );
    });
  }

  Widget _exportProfile() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return _view(
          header: 'Export profile',
          comment: 'To use this profile on another device',
          icon: Icons.file_upload_outlined,
          busy: model.exportProfileBusy,
          setBusy: (v) {
            model.exportProfileBusy = v;
            model.notify();
          },
          doTask: () async {
            var success = await ServiceApi().exportProfile();
            if (context.mounted) {
              if (success) {
                UiHelper.showToast(context, 'Exported');
              }
            }
            return true;
          });
    });
  }

  Widget _importProfile() {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return _view(
          header: 'Import profile',
          comment: 'Import profile and progress',
          icon: Icons.file_download_outlined,
          busy: model.importProfileBusy,
          setBusy: (v) {
            model.importProfileBusy = v;
            model.notify();
          },
          doTask: () async {
            var success = await ServiceApi().importProfile();
            if (success) {
              getIt<AppRep>().refreshWordToLearn();
              getIt<AppRep>().refreshManageList();
              if (context.mounted) {
                UiHelper.showToast(context, 'Imported');
              }
            }
            return true;
          });
    });
  }

  Widget _deleteProfile() {
    return Builder(builder: (context) {
      return _view(
          header: 'Delete profile',
          comment: 'This will delete all progress',
          icon: Icons.remove_circle_sharp,
          important: true,
          busy: false,
          setBusy: (_) {},
          doTask: () async {
            showModalBottomSheet(
                context: context,
                barrierColor: Colors.black26,
                builder: (BuildContext context) {
                  return ConfirmPanel(
                    title: 'Are you sure?',
                    text: 'You will lose all the progress',
                    iconNo: Icons.delete,
                    iconOk: Icons.close,
                    onOk: () async {
                      Navigator.of(context).pop();
                      await ServiceApi().deleteProfile();
                      if (context.mounted) {
                        UiHelper.showToast(context, 'Deleted');
                      }
                      getIt<AppRep>().refreshWordToLearn();
                      getIt<AppRep>().refreshManageList();
                    },
                  );
                });
            return true;
          });
    });
  }

  Widget _view({
    required String header,
    required String comment,
    required IconData icon,
    bool important = false,
    bool hightLightBackground = false,
    required bool busy,
    required Function(bool v) setBusy,
    required Future<bool> Function() doTask,
  }) {
    return Builder(builder: (context) {
      var model = context.watch<SettingsModel>();
      return Container(
        decoration: BoxDecoration(
          color: hightLightBackground
              ? Theme.of(context).colorScheme.cardUpgrade
              : Theme.of(context).colorScheme.cardHome,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(
          left: Constants.homeCardPadding,
          right: Constants.homeCardPadding,
          top: 15,
        ),
        child: Column(children: [
          Container(
              height: 30,
              margin: Constants.settingsHeaderPadding,
              child: Row(children: [
                Text(
                  header,
                  style: Theme.of(context).colorScheme.title1,
                )
              ])),
          ItemInMenuList(
              useBorderTop: false,
              useBorderBot: false,
              padding: EdgeInsets.only(
                  left: Constants.settingsCardPadding.left,
                  right: Constants.settingsCardPadding.right),
              onClicked: (_) async {
                setBusy(true);
                await doTask();
                setBusy(false);
                model.notify();
              },
              child: Row(children: [
                Text(
                  comment,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: important
                        ? Theme.of(context).colorScheme.titleErr
                        : Theme.of(context).colorScheme.title2.color,
                    fontSize: Theme.of(context).colorScheme.title2.fontSize,
                    fontFamily: Theme.of(context).colorScheme.title2.fontFamily,
                    fontWeight: Theme.of(context).colorScheme.title2.fontWeight,
                  ),
                  // style: Theme.of(context).colorScheme.title2,
                ),
                const Spacer(),
                if (busy)
                  SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.title5),
                  ),
                RoundButton(
                    iconData: icon,
                    height: Constants.baseButton,
                    width: Constants.baseButton,
                    iconSize: model.iconSize,
                    iconColor: important
                        ? Theme.of(context).colorScheme.titleErr
                        : Theme.of(context).colorScheme.iconColor,
                    useScaleAnimation: true,
                    color: Colors.transparent,
                    onPressed: (_) async {
                      setBusy(true);
                      await doTask();
                      setBusy(false);
                      model.notify();
                    })
              ]))
        ]),
      );
    });
  }
}

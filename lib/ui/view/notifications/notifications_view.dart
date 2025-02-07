import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:stacked/stacked.dart';

import 'notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(Notifications),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MenuItemTile(
                text: Text(NotifyAbout),
                subtitle: NotifyAboutSubtitle,
              ),
              const MenuItemTile(
                text: Text(NotifyOnMobile),
                subtitle: NotifyOnMobileSubtitle,
              ),
              const MenuItemTile(
                text: Text(Sound),
                subtitle: Ding,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(Vibrate),
                value: model.vibrate,
                onChanged: model.toggleVibrate,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(Light),
                value: model.light,
                onChanged: model.toggleLight,
              ),
              const MenuItemTile(
                text: Text(TroubleshootNotifs),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  GeneralSettings,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const MenuItemTile(
                text: Text(NotificationSchedule),
                subtitle: Everyday,
                topBorder: false,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(InAppNotif),
                subtitle: 'In-app notifications appear while the app is open',
                value: model.inAppNotification,
                onChanged: model.toggleInAppNotification,
              ),
              MenuItemTile.flipSwitch(
                text: const Text(MyKeyword),
                subtitle: MyKeywordSubtitle,
                value: model.notifyOnKeyword,
                onChanged: model.toggleNotifyOnKeyword,
              ),
              const MenuItemTile(
                text: Text(ChannelSPecificNotif),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NotificationsViewModel(),
    );
  }
}

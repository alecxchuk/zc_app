import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/unread_count.dart';
import 'package:hng/ui/shared/text_styles.dart';

class CustomChannelListTile extends StatelessWidget {
  final String channelName;
  final Function()? pressed;
  final bool isActive;
  final String? data;

  const CustomChannelListTile({
    Key? key,
    this.channelName = '',
    this.pressed,
    this.data,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        hash + '   ' + channelName,
        style: isActive
            ? AppTextStyle.darkGreySize12
            : AppTextStyle.darkGreySize12,
      ),
      isActive ? UnreadCount(count: int.parse(data!)) : Container()
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';

class StatusForm extends StatelessWidget {
  const StatusForm({
    Key? key,
    this.onPressed,
    this.tagIcon,
    this.statusText = 'What\'s your status?',
    this.clearOnPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  final void Function()? clearOnPressed;
  final String? tagIcon;
  final String? statusText;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return MaterialButton(
      textColor: AppColors.greyishColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          width: 1,
          color: Theme.of(context).textTheme.bodyText1!.color ??
              AppColors.zuriPrimaryColor,
        ),
      ),
      padding: const EdgeInsets.all(12),
      elevation: 3,
      onPressed: onPressed,
      child: Row(
        children: [
          tagIcon != null ? Text(tagIcon ?? '') : const Icon(bubble),
          const SizedBox(width: 7),
          Flexible(
            child: Text(
              statusText ?? local!.whatIsYourStatus,
            ),
            fit: FlexFit.tight,
          ),
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: clearOnPressed,
          ),
        ],
      ),
    );
  }
}

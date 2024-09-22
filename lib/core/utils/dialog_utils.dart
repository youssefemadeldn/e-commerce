import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ColorManager.primary,
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: ColorManager.white,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.white,
                      ),
                ),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context,
    String message, {
    String title = 'Title',
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.white,
                ),
          ),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.white,
                  ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.white,
                  ),
            ),
            actions: actions,
            titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.white,
                ),
            backgroundColor: ColorManager.primary,
          );
        });
  }
}

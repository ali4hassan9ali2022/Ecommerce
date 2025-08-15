import 'package:e_commerce/Core/Database/Local/supabase_helper.dart';
import 'package:e_commerce/Core/Utils/app_router.dart';
import 'package:e_commerce/Core/Utils/assets.dart';
import 'package:e_commerce/Core/Utils/strings.dart';
import 'package:e_commerce/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesWarning, width: 60, height: 60),
          SizedBox(height: 16),
          Text(
            Strings.confirmlogout,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    CustomToastWidget.showWarningToast("Don't log out");
                  },
                  child: Text(
                    Strings.cancel,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    SupabaseHelper.supabase.auth.signOut();
                    GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
                    CustomToastWidget.showSuccessToast("Log out done");
                  },
                  child: Text(
                    Strings.ok,
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/authentication/sign_out_service.dart';
import 'package:quiz_app/databases/local_db/local_db_query.dart';
import 'package:quiz_app/screens/sign_in_screen/sign_in_screen.dart';

class LogoutConfirmationDialogue extends ConsumerWidget with LocalDbQuery{
  LogoutConfirmationDialogue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("Logout Confirmation"),
      content: const Text("Are you sure want to logout"),
      actions: [
        FilledButton.tonal(
            onPressed: (){
              FirebaseSignOutService.completeSignOut().whenComplete(() => clearDatabase().whenComplete(() {
                Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeAddress, (route) => false);
              }));

            }, child: const Text("Yes")),

        FilledButton.tonal(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("Cancel Logout"))
      ],
    );
  }
}

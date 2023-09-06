
import 'package:flutter/material.dart';



class ProcessFailedIndicator extends StatelessWidget {
  final String _failedReason;
  final VoidCallback _action;
  const ProcessFailedIndicator({Key? key,
  required String failedReason,
    required VoidCallback action
  }) :_failedReason = failedReason,
        _action = action,
        super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(children: [
     const Text("Process failed"),
     Text(_failedReason),

     ElevatedButton(onPressed:_action, child: const Text("Try Again"))

   ],);
  }
}

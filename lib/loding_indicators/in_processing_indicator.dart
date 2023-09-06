

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/extensions/media_query_extension.dart';

class InProcessingIndicator extends StatefulWidget {
  const InProcessingIndicator({Key? key}) : super(key: key);

  @override
  State<InProcessingIndicator> createState() => _InProcessingIndicatorState();
}

class _InProcessingIndicatorState extends State<InProcessingIndicator> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =  AnimationController(vsync: this,duration:const  Duration(milliseconds: 400))..forward()..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.width*.02,vertical: context.height*.03),
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context,child) {
              return Center(
                child: Wrap(spacing: context.width*.02,children:List.generate(5, (index){
                  return Transform.scale(scale: sin(_controller.value+index*.5),
                      child: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.surfaceTint,
                        radius: context.width*.02,));
                }),),
              );
            }
        ),),
    );
  }
}

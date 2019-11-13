import 'package:dgha_brochure/misc/styles.dart';
import 'package:flutter/material.dart';

class LoadingText extends StatelessWidget {
  final bool condition;
  LoadingText({@required this.condition});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (this.condition) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              child: Text(
                "Loading . . .",
                style: Styles.h1Style,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:oeber/themes/theme_data.dart';

class DefaultDialog extends StatelessWidget {
  final String heading;
  final String body;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback onLeftButtonPress;
  final VoidCallback onRightButtonPress;

  const DefaultDialog({
    Key? key,
    required this.heading,
    required this.body,
    required this.leftButtonText,
    required this.rightButtonText,
    required this.onLeftButtonPress,
    required this.onRightButtonPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogBox(context),
    );
  }

  Widget dialogBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: greyBackgroundColour,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              heading,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 0.3,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              body,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 0.3,
            width: double.infinity,
            color: Colors.grey,
          ),
          SizedBox(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: onLeftButtonPress,
                  child: Text(
                    leftButtonText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 0.3,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                TextButton(
                  onPressed: onRightButtonPress,
                  child: Text(
                    rightButtonText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

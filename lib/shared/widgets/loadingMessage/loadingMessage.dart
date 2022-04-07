import 'package:bytebank/shared/theme/appColor.dart';
import 'package:flutter/material.dart';

class LoadingMessage extends StatefulWidget {
  const LoadingMessage({Key? key}) : super(key: key);

  @override
  State<LoadingMessage> createState() => _LoadingMessageState();
}

class _LoadingMessageState extends State<LoadingMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 270),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Visibility(
            child: CircularProgressIndicator(
                color: AppColor.greenLogo, strokeWidth: 10),
            visible: true,
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Text(
              "loading",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

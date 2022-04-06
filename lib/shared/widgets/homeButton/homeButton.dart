import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  final void Function() redirectFunction;
  final String name;
  final IconData icon;
  final double width;

  const HomeButton({
    Key? key,
    required this.redirectFunction,
    required this.name,
    required this.icon,
    this.width = 0,
  }) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: widget.width != 0 ? widget.width : 180,
        color: Theme.of(context).primaryColor,
        child: Material(
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: widget.redirectFunction,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

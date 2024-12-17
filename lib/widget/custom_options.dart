import 'package:flutter/material.dart';

class CustomOptions extends StatefulWidget {
  final String label;
  final Function(String) option;
  const CustomOptions({super.key, required this.label, required this.option});

  @override
  State<CustomOptions> createState() => _CustomOptionsState();
}

class _CustomOptionsState extends State<CustomOptions> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
          widget.option(widget.label);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isTapped ? Color(0xFF0F3CC9).withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.black, width: 1)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Text(widget.label, style: TextStyle(fontSize: 16),),
        ),
      ),
    );
  }
}

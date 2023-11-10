import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class HelloContainer extends StatefulWidget {
  final String title;
  final String? text;
  final IconData? icon;

  HelloContainer({
    required this.title,
    this.text,
    Key? key,
    this.icon,
  }) : super(key: key);

  @override
  State<HelloContainer> createState() => _HelloContainerState();
}

class _HelloContainerState extends State<HelloContainer> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    Color iconColor;

    if (widget.title == "Women Savings" || widget.title == "Women Loans") {
      iconColor = Color.fromARGB(255, 1, 226, 9);
    } else if (widget.title == "Men Savings" || widget.title == "Men Loans") {
      iconColor = const Color.fromARGB(255, 179, 108, 1);
    } else if (widget.title == "PWDs Savings" || widget.title == "PWDs Loans") {
      iconColor = Color.fromARGB(255, 150, 135, 2);
    } else {
      // Default color when title doesn't match "women" or "men"
      iconColor = Colors.black;
    }

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: 80,
        width: 200,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isHovering
              ? Colors.white
              : const Color.fromARGB(255, 216, 216, 216),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              size: 45,
              color: iconColor, // Set the icon color based on the title
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
                Text(widget.text!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomToggleButton extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onToggle;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;

  const CustomToggleButton({
    super.key,
    this.initialValue = false,
    required this.onToggle,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.width = 70,
    this.height = 40,
  });

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late bool _isToggled;

  @override
  void initState() {
    super.initState();
    _isToggled = widget.initialValue;
  }

  void _toggleButton() {
    setState(() {
      _isToggled = !_isToggled;
      widget.onToggle(_isToggled);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleButton,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.height / 2),
            color: _isToggled ? widget.activeColor : widget.inactiveColor,
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            alignment:
                _isToggled ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.all(4),
              width: widget.height - 8,
              height: widget.height - 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.black45,
    this.iconSize = 24,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            color: backgroundColor,
            child: Padding(
              padding: padding,
              child: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8), // Add some space between icon and text
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SingleButton extends StatefulWidget {
  const SingleButton({
    super.key,
    required this.onTap,
    required this.text,
    this.disabled = false,
    this.iconSize = 18.0,
    this.fontWeight = FontWeight.w600,
    this.fontSize,
    this.buttonColor,
    this.confirmColor,
    this.textColor,
    this.iconData,
    this.borderColor,
    this.iconColor,
    this.mainColor,
    this.borderSide,
    this.textSize,
    this.padding,
    this.toUperCase = false,
  });

  final Function()? onTap;
  final String text;

  /// the main color overrides the specific colors of the button, like border, text and icon color as well
  final Color? mainColor;

  final Color? borderColor;
  final bool disabled;
  final double? iconSize, fontSize;
  final FontWeight fontWeight;
  final Color? buttonColor, confirmColor, textColor, iconColor;
  final IconData? iconData;
  final double? textSize;
  final BorderSide? borderSide;
  final EdgeInsets? padding;

  final bool toUperCase;

  @override
  SingleButtonState createState() => SingleButtonState();
}

class SingleButtonState extends State<SingleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: double.maxFinite,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            backgroundColor: widget.buttonColor!.withOpacity(widget.disabled ? 0.6 : 1.0),
            shape: RoundedRectangleBorder(
              side: widget.borderSide != null
                  ? widget.borderSide!
                  : widget.mainColor != null || widget.borderColor != null
                      ? BorderSide(color: widget.mainColor ?? widget.borderColor!)
                      : BorderSide.none,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          onPressed: widget.disabled ? null : widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (widget.iconData != null)
                Icon(
                  widget.iconData,
                  color: widget.mainColor ?? widget.iconColor ?? Colors.white,
                  size: widget.iconSize,
                ),
              const SizedBox(width: 10.0),
              Text(
                widget.toUperCase ? widget.text.toUpperCase() : widget.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Gilam',
                  color: widget.mainColor ?? widget.textColor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

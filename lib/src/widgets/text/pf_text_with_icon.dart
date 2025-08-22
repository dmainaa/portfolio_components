import 'package:flutter/material.dart';
import '../../theme/app_size.dart';
import 'pf_text.dart';


class PFTextWithIcon extends PFText {
  final IconData icon;
  final Color? iconColor;
  final double iconSpacing;
  final bool iconOnRight;

  const PFTextWithIcon(
    super.text, {
    super.key,
    required this.icon,
    this.iconSpacing = PFAppSize.s8,
    this.iconOnRight = false,
    this.iconColor = Colors.white,
    super.textColor = Colors.white,
    super.style,
    super.textAlign,
    super.maxLines = 1,
    super.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = super.build(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
     
      children: iconOnRight
          ? [
              Expanded(child: PFText(super.text, maxLines: 1,)),
              SizedBox(width: iconSpacing),
              Icon(icon, color: iconColor,),
            ]
          : [
              Icon(icon, color: iconColor,),
              SizedBox(width: iconSpacing),
              Expanded(flex: 3, child: PFText(super.text, maxLines: 1,)),
            ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? bgColor;
  final Widget? child;
  final bool? isShadow;

  const CustomContainer(
      {Key? key,
      this.height,
      this.width,
      this.radius,
      this.bgColor,
      this.child,
      this.isShadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: child ?? const SizedBox(),
      decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(radius ?? 0),
          boxShadow: <BoxShadow>[
            isShadow == true
                ? BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(2, 2),
                    color: Theme.of(context).hintColor.withOpacity(0.4))
                : BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.0)),
          ]),
    );
  }
}

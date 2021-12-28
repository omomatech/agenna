import 'package:flutter/material.dart';
import 'package:agenna/app/helper/constant.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key, @required this.mobileBody, this.tabletBody, this.desktopBody})
      : super(key: key);
  final Widget? mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      if (dimens.maxWidth < KTabletBreakPoint) {
        return mobileBody!;
      } else if (dimens.maxWidth >= KTabletBreakPoint &&
          dimens.maxWidth < KDesktopBreakPoint) {
        return tabletBody ?? mobileBody!;
      } else {
        return desktopBody ?? mobileBody!;
      }
    });
  }
}

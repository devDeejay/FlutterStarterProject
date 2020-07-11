import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Enums for different screen sizes
enum DeviceScreenType { Mobile, Tablet, Desktop }

/// GetDeviceType Function
/// This is where we define our screen widths for different layouts
DeviceScreenType getDeviceType(MediaQueryData mediaQueryData) {
  var orientation = mediaQueryData.orientation;

  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQueryData.size.height;
  } else {
    deviceWidth = mediaQueryData.size.width;
  }

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}

/// Sizing Information
class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final localWidgetSize;

  SizingInformation(
      {this.orientation,
      this.deviceScreenType,
      this.screenSize,
      this.localWidgetSize});

  @override
  String toString() {
    return 'SizingInformation{orientation: $orientation, deviceScreenType: $deviceScreenType, screenSize: $screenSize, localWidgetsize: $localWidgetSize}';
  }
}

class OrientationLayout extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  OrientationLayout({Key key, this.landscape, this.portrait}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return landscape ?? portrait;
    }

    return portrait;
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext buildContext, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizingInformation = SizingInformation(
      orientation: mediaQuery.orientation,
      deviceScreenType: getDeviceType(mediaQuery),
    );
    return builder(context, sizingInformation);
  }
}

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
          if (desktop != null) {
            return desktop;
          }
        }
        return mobile;
      },
    );
  }
}

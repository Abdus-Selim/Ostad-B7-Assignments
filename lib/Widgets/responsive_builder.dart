import 'package:flutter/cupertino.dart';
import 'package:module_12_assignment_app/Utils/screen_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    final DeviceType deviceType = ScreenUtils.getDeviceType(size);
    print(deviceType);

    if (deviceType == DeviceType.mobile) {
      return mobile;
    } else if (deviceType == DeviceType.tablet) {
      return tablet ?? mobile;
    }
    return desktop;
  }
}

enum DeviceType {
  mobile,
  tablet,
  desktop,
}

class ScreenUtils {
  static const double maxMobileSize = 640;
  static const double maxTabletSize = 1008;
  static const double minDesktopSize = 1008;

  static DeviceType getDeviceType(double width) {
    if (width < ScreenUtils.maxMobileSize) {
      return DeviceType.mobile;
    } else if (width >= ScreenUtils.maxMobileSize &&
        width < ScreenUtils.maxTabletSize) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}

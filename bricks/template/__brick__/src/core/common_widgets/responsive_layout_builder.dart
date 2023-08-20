import 'package:flutter/material.dart';
import '../constant/breakpoint.dart';

typedef Responsive = Widget;

class ResponsiveLayout extends StatelessWidget {
  /// Creates a widget that defers its building until layout.
  /// -------
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  ///
  /// ```dart
  /// Responsive(
  ///       tablet: Container(
  ///         width: double.infinity,
  ///         height: double.infinity,
  ///         color: Colors.pink,
  ///         alignment: Alignment.center,
  ///         child: const Text("tablet"),
  ///       ),
  ///       desktop: Container(
  ///         width: double.infinity,
  ///         height: double.infinity,
  ///         color: Colors.blue,
  ///         alignment: Alignment.center,
  ///         child: const Text("desktop"),
  ///       ),
  ///       mobile: Container(
  ///         width: double.infinity,
  ///         height: double.infinity,
  ///         color: Colors.white,
  ///         alignment: Alignment.center,
  ///         child: const Text("mobile"),
  ///       ),
  ///     ),
  /// ```
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.dekstop,
  });

  /// [Responsive] for mobile.
  final Responsive mobile;

  /// [Responsive] for tablet.
  final Responsive tablet;

  /// [Responsive] for desktop.
  final Responsive dekstop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth < Breakpoint.desktop) {
        return tablet;
      } else if (constraint.maxWidth < Breakpoint.tablet) {
        return mobile;
      }
      return dekstop;
    });
  }
}

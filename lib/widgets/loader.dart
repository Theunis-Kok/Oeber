import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oeber/themes/theme_data.dart';

class LoaderOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context, String? message) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry(context, message);
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static OverlayEntry _createOverlayEntry(
    BuildContext context,
    String? message,
  ) {
    return OverlayEntry(
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.85),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/lotties/test_animation.json',
                    width: 600,
                    height: 600,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message ?? "",
                      style: defaultTextStyle(),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../../core/style/colors.dart';

class SliderWidget extends StatefulWidget {
  final int levels; // Number of levels for the slider

  const SliderWidget({super.key, this.levels = 10});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  var _volume = 0.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 15.0,
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: SliderComponentShape.noThumb,
        trackShape: const MyRoundedRectSliderTrackShape(),
      ),
      child: Slider(
        min: 0,
        max: widget.levels.toDouble(),
        divisions: widget.levels,
        value: _volume,
        onChanged: (value) => setState(() => _volume = value),
        inactiveColor: Colors.transparent,
      ),
    );
  }
}

class MyRoundedRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  const MyRoundedRectSliderTrackShape();

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 0,
        Offset? secondaryOffset, // Add this parameter
      }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);

    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }
    final trackHeight = sliderTheme.trackHeight!;

    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    activePaint.shader = ui.Gradient.linear(
      ui.Offset(trackRect.left, 0),
      ui.Offset(thumbCenter.dx, 0),
      [
        AppColors.orange2,
        AppColors.orange,

      ],
    );

    final Radius trackRadius = Radius.circular(trackRect.height / 2);

    final Paint shadow = Paint()..color = const Color(0xffb3b6c7);
    context.canvas.clipRRect(
      RRect.fromLTRBR(trackRect.left, trackRect.top, trackRect.right,
          trackRect.bottom, trackRadius),
    );

    context.canvas.drawRRect(
        RRect.fromLTRBR(trackRect.left, trackRect.top, trackRect.right,
            trackRect.bottom, trackRadius),
        shadow);

    shadow
      ..color = Colors.white
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        ui.Shadow.convertRadiusToSigma(10),
      );

    context.canvas.drawRRect(
        RRect.fromLTRBR(
          trackRect.left - trackHeight,
          trackRect.top + trackHeight / 2,
          trackRect.right - 0,
          trackRect.bottom + trackHeight / 2,
          trackRadius,
        ),
        shadow);

    shadow
      ..color = const Color(0xfff0f1f5)
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        ui.Shadow.convertRadiusToSigma(15),
      );

    context.canvas.drawRRect(
        RRect.fromLTRBR(
          trackRect.left - trackHeight,
          trackRect.top + trackHeight / 8,
          trackRect.right - trackHeight / 8,
          trackRect.bottom,
          trackRadius,
        ),
        shadow);

    context.canvas.drawRRect(
      RRect.fromLTRBR(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBR(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        trackRadius,
      ),
      rightTrackPaint,
    );
  }
}

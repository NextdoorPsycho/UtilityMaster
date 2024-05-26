import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arcane/arcane.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum UMTStyle { h1, h2, h3, h4, lead, small, muted, p, blockquote, table }

class UMT {
  static Text h0(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.h1Large,
    );
  }

  static Text h1(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.h1,
    );
  }

  static Text h2(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.h2,
    );
  }

  static Text h3(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.h3,
    );
  }

  static Text h4(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.h4,
    );
  }

  static Text txt(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.p,
    );
  }

  static Text bloq(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.blockquote,
    );
  }

  static Text bold(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.table,
    );
  }

  static Text lead(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.lead,
    );
  }

  static Text small(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.small,
    );
  }

  static Text muted(BuildContext context, String text) {
    return Text(
      text,
      style: ShadTheme.of(context).textTheme.muted,
    );
  }

  static Widget animated(
      BuildContext context, UMTStyle style, Duration speed, String text) {
    TextStyle textStyle;
    switch (style) {
      case UMTStyle.h1:
        textStyle = ShadTheme.of(context).textTheme.h1;
        break;
      case UMTStyle.h2:
        textStyle = ShadTheme.of(context).textTheme.h2;
        break;
      case UMTStyle.h3:
        textStyle = ShadTheme.of(context).textTheme.h3;
        break;
      case UMTStyle.h4:
        textStyle = ShadTheme.of(context).textTheme.h4;
        break;
      case UMTStyle.lead:
        textStyle = ShadTheme.of(context).textTheme.lead;
        break;
      case UMTStyle.small:
        textStyle = ShadTheme.of(context).textTheme.small;
        break;
      case UMTStyle.muted:
        textStyle = ShadTheme.of(context).textTheme.muted;
        break;
      case UMTStyle.p:
        textStyle = ShadTheme.of(context).textTheme.p;
        break;
      case UMTStyle.blockquote:
        textStyle = ShadTheme.of(context).textTheme.blockquote;
        break;
      case UMTStyle.table:
        textStyle = ShadTheme.of(context).textTheme.table;
        break;
      default:
        textStyle = ShadTheme.of(context).textTheme.p;
        break;
    }

    return AnimatedTextKit(
      key: ValueKey(
        Arcane.isDark ? 'darkAnimatedText$text' : 'lightAnimatedText$text',
      ),
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          cursor: '|',
          textAlign: TextAlign.center,
          speed: speed,
          textStyle: textStyle,
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: false,
      stopPauseOnTap: false,
    );
  }
}

// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/RobotoMono-Bold.ttf
  String get robotoMonoBold => 'assets/fonts/RobotoMono-Bold.ttf';

  /// File path: assets/fonts/RobotoMono-BoldItalic.ttf
  String get robotoMonoBoldItalic => 'assets/fonts/RobotoMono-BoldItalic.ttf';

  /// File path: assets/fonts/RobotoMono-ExtraLight.ttf
  String get robotoMonoExtraLight => 'assets/fonts/RobotoMono-ExtraLight.ttf';

  /// File path: assets/fonts/RobotoMono-ExtraLightItalic.ttf
  String get robotoMonoExtraLightItalic =>
      'assets/fonts/RobotoMono-ExtraLightItalic.ttf';

  /// File path: assets/fonts/RobotoMono-Italic-VariableFont_wght.ttf
  String get robotoMonoItalicVariableFontWght =>
      'assets/fonts/RobotoMono-Italic-VariableFont_wght.ttf';

  /// File path: assets/fonts/RobotoMono-Italic.ttf
  String get robotoMonoItalic => 'assets/fonts/RobotoMono-Italic.ttf';

  /// File path: assets/fonts/RobotoMono-Light.ttf
  String get robotoMonoLight => 'assets/fonts/RobotoMono-Light.ttf';

  /// File path: assets/fonts/RobotoMono-LightItalic.ttf
  String get robotoMonoLightItalic => 'assets/fonts/RobotoMono-LightItalic.ttf';

  /// File path: assets/fonts/RobotoMono-Medium.ttf
  String get robotoMonoMedium => 'assets/fonts/RobotoMono-Medium.ttf';

  /// File path: assets/fonts/RobotoMono-MediumItalic.ttf
  String get robotoMonoMediumItalic =>
      'assets/fonts/RobotoMono-MediumItalic.ttf';

  /// File path: assets/fonts/RobotoMono-Regular.ttf
  String get robotoMonoRegular => 'assets/fonts/RobotoMono-Regular.ttf';

  /// File path: assets/fonts/RobotoMono-SemiBold.ttf
  String get robotoMonoSemiBold => 'assets/fonts/RobotoMono-SemiBold.ttf';

  /// File path: assets/fonts/RobotoMono-SemiBoldItalic.ttf
  String get robotoMonoSemiBoldItalic =>
      'assets/fonts/RobotoMono-SemiBoldItalic.ttf';

  /// File path: assets/fonts/RobotoMono-Thin.ttf
  String get robotoMonoThin => 'assets/fonts/RobotoMono-Thin.ttf';

  /// File path: assets/fonts/RobotoMono-ThinItalic.ttf
  String get robotoMonoThinItalic => 'assets/fonts/RobotoMono-ThinItalic.ttf';

  /// File path: assets/fonts/RobotoMono-VariableFont_wght.ttf
  String get robotoMonoVariableFontWght =>
      'assets/fonts/RobotoMono-VariableFont_wght.ttf';

  /// List of all assets
  List<String> get values => [
    robotoMonoBold,
    robotoMonoBoldItalic,
    robotoMonoExtraLight,
    robotoMonoExtraLightItalic,
    robotoMonoItalicVariableFontWght,
    robotoMonoItalic,
    robotoMonoLight,
    robotoMonoLightItalic,
    robotoMonoMedium,
    robotoMonoMediumItalic,
    robotoMonoRegular,
    robotoMonoSemiBold,
    robotoMonoSemiBoldItalic,
    robotoMonoThin,
    robotoMonoThinItalic,
    robotoMonoVariableFontWght,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/IMG_0776.jpg
  AssetGenImage get img0776 =>
      const AssetGenImage('assets/images/IMG_0776.jpg');

  /// File path: assets/images/IMG_2891.JPG
  AssetGenImage get img2891 =>
      const AssetGenImage('assets/images/IMG_2891.JPG');

  /// File path: assets/images/images.jpeg
  AssetGenImage get images => const AssetGenImage('assets/images/images.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [img0776, img2891, images];
}

class $AssetsL10nGen {
  const $AssetsL10nGen();

  /// File path: assets/l10n/intl_ru.arb
  String get intlRu => 'assets/l10n/intl_ru.arb';

  /// List of all assets
  List<String> get values => [intlRu];
}

class Assets {
  const Assets._();

  static const AssetGenImage appLogo = AssetGenImage('assets/AppLogo.jpg');
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsL10nGen l10n = $AssetsL10nGen();

  /// List of all assets
  static List<AssetGenImage> get values => [appLogo];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

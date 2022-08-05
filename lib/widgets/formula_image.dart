import 'package:flutter/material.dart';

class FormulaImage extends StatelessWidget {
  const FormulaImage._({
    Key? key,
    this.width,
    this.height,
    required this.type,
    required this.asset,
    this.fit,
  }) : super(key: key);

  final double? width;
  final double? height;
  final FormulaImageType type;
  final String asset;
  final BoxFit? fit;

  factory FormulaImage.logoBlack({double? width, double? height, BoxFit? fit}) => FormulaImage._(
        type: FormulaImageType.logo,
        asset: 'F1-LOGO-black',
        width: width,
        height: height,
      );

  factory FormulaImage.logoWhite({double? width, double? height, BoxFit? fit}) => FormulaImage._(
        type: FormulaImageType.logo,
        asset: 'F1-LOGO-white',
        width: width,
        height: height,
        fit: fit,
      );

  factory FormulaImage.charles({double? width, double? height, BoxFit? fit}) => FormulaImage._(
        type: FormulaImageType.image,
        asset: 'charles',
        width: width,
        height: height,
        fit: fit,
      );

  factory FormulaImage.perez({double? width, double? height, BoxFit? fit}) => FormulaImage._(
        type: FormulaImageType.image,
        asset: 'perez',
        width: width,
        height: height,
        fit: fit,
      );

  factory FormulaImage.verstappen({double? width, double? height, BoxFit? fit}) => FormulaImage._(
        type: FormulaImageType.image,
        asset: 'verstappen',
        width: width,
        height: height,
        fit: fit,
      );

  factory FormulaImage.f1Car({double? width, double? height, BoxFit? fit}) => FormulaImage._(
        type: FormulaImageType.image,
        asset: 'f1-car',
        width: width,
        height: height,
        fit: fit,
      );

  factory FormulaImage.f1Driver({double? width, double? height, BoxFit? fit}) => FormulaImage._(
        type: FormulaImageType.image,
        asset: 'f1-driver',
        width: width,
        height: height,
        fit: fit,
      );

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/${type.path}/$asset.png'),
      width: width,
      height: height,
      fit: fit,
    );
  }
}

enum FormulaImageType {
  image('images'),
  logo('logos');

  final String path;

  const FormulaImageType(this.path);
}

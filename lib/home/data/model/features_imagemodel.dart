import 'package:info_dev/const/app_const.dart';

class FeaturedImageModel {
  final String featureImage;

  FeaturedImageModel({required this.featureImage});
}

List<FeaturedImageModel> imageList = [
  FeaturedImageModel(featureImage: AppConst.featureImage1),
  FeaturedImageModel(featureImage: AppConst.featureImaeg2),
  FeaturedImageModel(featureImage: AppConst.featureImaeg3)
];

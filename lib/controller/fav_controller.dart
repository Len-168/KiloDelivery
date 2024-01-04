// import 'package:delivery_app/repository/repo_local.dart';
// import 'package:delivery_app/repository/data.dart';
// import 'package:get/get.dart';

// class FavController extends GetxController {
//   late final productDetails = <ProductDetile>[].obs;
//   final productStorage = ProductStorage.instance;
//   final favIconState = false.obs;

//   void initData(ProductDetile productDetile) {
//     favIconState(isContain(productDetile));
//   }

//   bool isContain(ProductDetile productDetile) =>
//       productDetails
//           .indexWhere((element) => element.title == productDetile.title) !=
//       -1;

//   void SaveFavItem(ProductDetile productDetile) async {
//     if (isContain(productDetile)) {
//       deleteFavItem(productDetile);
//       favIconState(false);
//       return;
//     }

//     final isSave =
//         await productStorage.putProductDetail(productDetile, "FavItems");
//     favIconState(isSave);
//   }

//   void getProductFavItem() async {
//     final imageDetails = await productStorage.getProductItems("FavItems");
//     productDetails.value = imageDetails;
//   }

//   void deleteFavItem(ProductDetile productDetile) async {
//     final index = productDetails
//         .indexWhere((element) => element.title == productDetile.title);
//     productDetails.removeAt(index);
//     await productStorage.putProductDetails(productDetails, "FavItems");
//   }
// }

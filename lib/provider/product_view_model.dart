import 'package:flutter/cupertino.dart';
import '../models/product_model.dart';
import '../services/product/product_services.dart';

class ProductViewModel with ChangeNotifier {
  List<ProductModel> products = [];

  /// Fetch all products
  Future<void> getProduct() async {
    products = await ProductServices.getAllProducts();
    notifyListeners();
  }

  /// Fetch photos (implemented for consistency with PhotosScreen)
  Future<List<ProductModel>> getPhotosApi() async {
    return await ProductServices.getAllProducts();
  }

}
import 'dart:convert';
import 'package:http/http.dart'as http;

import '../../models/product_model.dart';

class ProductServices{

  static Future<List<ProductModel> > getAllProducts()async{
    List<ProductModel> productList = [];
    try{
      var response =await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if(response.statusCode == 200){
        List<dynamic> jsonData = json.decode(response.body);
        productList =  jsonData.map((e) => ProductModel.fromMap(e),).toList();
      }
    }catch(e){
      print(e);
    }
    return productList;
  }
}
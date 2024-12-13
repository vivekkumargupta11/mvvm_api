import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_api/provider/product_view_model.dart';
import 'package:mvvm_api/views/home_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductViewModel(),),
          // ChangeNotifierProvider(create: (context) => ProductViewModel(),),
        ],
        child:MyApp() ,)
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotosScreen() ,
    );
  }
}
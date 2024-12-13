import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../provider/product_view_model.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  late Future<List<ProductModel>> getPhotos;

  @override
  void initState() {
    super.initState();
    getPhotos = Provider.of<ProductViewModel>(context, listen: false).getPhotosApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'PhotosApiMvvm',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () {  }, // Yahan apne icon set karo

        ),
      ),

      body: FutureBuilder<List<ProductModel>>(
        future: getPhotos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No photos found'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: ListTile(
                    leading: ClipOval(
                      child: Image.network(
                        product.image ?? '', // Display the product image
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    title: Text(
                      product.title ?? 'No Title', // Display the product title
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '\$${product.price?.toStringAsFixed(2) ?? '0.00'}', // Display the product price
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:module_12_assignment_app/models/product.dart';
import 'package:module_12_assignment_app/screens/add_new_product_screen.dart';
import 'package:module_12_assignment_app/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.white70,
        actions: [
          IconButton(
              onPressed: () {
                getProductList();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: productList[index],
                    );
                  },
                  itemCount: productList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddNewProductScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/ReadProduct");
    Response response = await get(uri);
    print("requesting");
    // print(response);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
          id: item['_id'] ?? "",
          productName: item['ProductName'] ?? "Unknown",
          productCode: item['ProductCode'] ?? "Unknown",
          productImage: item['Img'] ?? "Unknown",
          unitPrice: item['UnitPrice'] ?? "Unknown",
          quantity: item['Qty'] ?? "Unknown",
          totalPrice: item['TotalPrice'] ?? "Unknown",
          createdAt: item['CreatedDate'] ?? "Unknown",
        );
        productList.add(product);
      }
      _inProgress = false;
      setState(() {});
    }
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> deleteProduct(
    BuildContext context, String productId, Function onSuccess) async {
  try {
    Uri uri =
        Uri.parse("http://164.68.107.70:6060/api/v1/DeleteProduct/$productId");
    print("Deleting product at URI: $uri");
    Response response = await get(uri);

    if (response.statusCode == 200) {
      onSuccess();
      print('Delete successful');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product Deleted Successfully")));
    } else {
      print(
          'Failed to delete product with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error deleting product: ${e.toString()}');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error deleting product: ${e.toString()}")));
  }
}

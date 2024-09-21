import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> deleteProduct(BuildContext context, String productId) async {
  try {
    Uri uri =
        Uri.parse("http://164.68.107.70:6060/api/v1/DeleteProduct/$productId");
    print("Deleting product at URI: $uri");
    Response response =
        await get(uri); // Make sure this is a 'get' as your server expects

    if (response.statusCode == 200) {
      print('Delete successful');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product Deleted Successfully")));
    } else {
      print(
          'Failed to delete product with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to delete product: ${response.body}")));
    }
  } catch (e) {
    print('Error deleting product: ${e.toString()}');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error deleting product: ${e.toString()}")));
  }
}

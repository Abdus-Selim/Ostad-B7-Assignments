import 'package:flutter/material.dart';
import 'package:module_12_assignment_app/models/product.dart';
import 'package:module_12_assignment_app/screens/update_product_screen.dart';
import 'package:module_12_assignment_app/widgets/delete_entry.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.onDelete,
  });

  final Product product;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.white,
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: ${product.productCode}"),
          Text("Unit Price: \$${product.unitPrice}"),
          Text("Quantity: ${product.quantity}"),
          Text("Total Price: \$${product.totalPrice}"),
          Text("Product ID: ${product.id}"),
          Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UpdateProductScreen(product: product);
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text("Edit"),
              ),
              TextButton.icon(
                onPressed: () {
                  deleteProduct(context, product.id, onDelete);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                label: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

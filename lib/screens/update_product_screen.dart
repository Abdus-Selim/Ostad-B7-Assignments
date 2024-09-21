import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEcontroller =
      TextEditingController();
  final TextEditingController _unitPriceTEcontroller = TextEditingController();
  final TextEditingController _totalPriceTEcontroller = TextEditingController();
  final TextEditingController _imageTEcontroller = TextEditingController();
  final TextEditingController _quantityTEcontroller = TextEditingController();
  final TextEditingController _codeTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildNewProductForm(),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Name',
              labelText: 'Product Name',
            ),
          ),
          TextFormField(
            controller: _unitPriceTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Unit Price',
              labelText: 'Product Price',
            ),
          ),
          TextFormField(
            controller: _totalPriceTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price',
            ),
          ),
          TextFormField(
            controller: _imageTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Image',
              labelText: 'Product Image',
            ),
          ),
          TextFormField(
            controller: _codeTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Product Code',
              labelText: 'Product Code',
            ),
          ),
          TextFormField(
            controller: _quantityTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Product Quantity',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            onPressed: _onTapProductButton,
            child: const Text("Update"),
          )
        ],
      ),
    );
  }

  void _onTapProductButton() {}

  @override
  void dispose() {
    _productNameTEcontroller.dispose();
    _unitPriceTEcontroller.dispose();
    _totalPriceTEcontroller.dispose();
    _imageTEcontroller.dispose();
    _codeTEcontroller.dispose();
    _quantityTEcontroller.dispose();
    super.dispose();
  }
}

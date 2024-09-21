import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:module_12_assignment_app/models/form_validator.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEcontroller =
      TextEditingController();
  final TextEditingController _unitPriceTEcontroller = TextEditingController();
  final TextEditingController _totalPriceTEcontroller = TextEditingController();
  final TextEditingController _imageTEcontroller = TextEditingController();
  final TextEditingController _quantityTEcontroller = TextEditingController();
  final TextEditingController _codeTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildNewProductForm(),
        ),
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
            validator: (String? value) {
              return FormValidator.validateValue(value);
            },
          ),
          TextFormField(
            controller: _unitPriceTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Unit Price',
              labelText: 'Product Price',
            ),
            validator: (String? value) {
              return FormValidator.validateValue(value);
            },
          ),
          TextFormField(
            controller: _totalPriceTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price',
            ),
            validator: (String? value) {
              return FormValidator.validateValue(value);
            },
          ),
          TextFormField(
            controller: _imageTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Image',
              labelText: 'Product Image',
            ),
            validator: (String? value) {
              return FormValidator.validateValue(value);
            },
          ),
          TextFormField(
            controller: _codeTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Product Code',
              labelText: 'Product Code',
            ),
            validator: (String? value) {
              return FormValidator.validateValue(value);
            },
          ),
          TextFormField(
            controller: _quantityTEcontroller,
            decoration: const InputDecoration(
              hintText: 'Quantity',
              labelText: 'Product Quantity',
            ),
            validator: (String? value) {
              return FormValidator.validateValue(value);
            },
          ),
          const SizedBox(height: 16),
          _inProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                  onPressed: _onTapProductButton,
                  child: const Text("Add Product"),
                )
        ],
      ),
    );
  }

  void _onTapProductButton() {
    if (_formKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/CreateProduct");
    Map<String, dynamic> requestBody = {
      "Img": _imageTEcontroller.text,
      "ProductCode": _codeTEcontroller.text,
      "ProductName": _productNameTEcontroller.text,
      "Qty": _quantityTEcontroller.text,
      "TotalPrice": _totalPriceTEcontroller.text,
      "UnitPrice": _unitPriceTEcontroller.text,
    };

    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      _clearTestFields();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("New product added succesfully")));
    }

    _inProgress = false;
    setState(() {});
  }

  void _clearTestFields() {
    _productNameTEcontroller.clear();
    _unitPriceTEcontroller.clear();
    _totalPriceTEcontroller.clear();
    _imageTEcontroller.clear();
    _codeTEcontroller.clear();
    _quantityTEcontroller.clear();
  }

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

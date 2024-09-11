import 'package:flutter/material.dart';
import 'package:module_12_assignment_app/utils/bag_items_screen.dart';
import 'package:module_12_assignment_app/utils/total_price.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bag_item = MyBagScreen().bagItems;

  CongratsSnackbar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  final TotalPrice totalPrice = TotalPrice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(
          "My Bag",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade300,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: _buildCardListViewBuilder(),
            ),
            Row(
              children: [
                build_checkout_section(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardListViewBuilder() {
    return ListView.builder(
      itemCount: bag_item.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: _buildCardDesign(index),
        );
      },
    );
  }

  Widget _buildCardDesign(int index) {
    return Card(
      color: Colors.grey.shade200,
      child: SizedBox(
        height: 126,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Image.network(
                bag_item[index].itemImage,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${bag_item[index].itemTitle}\n",
                              style: const TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "Color: ",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            TextSpan(
                              text: bag_item[index].itemColor,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            // SizedBox(width: 8.0),
                            TextSpan(
                              text: "   Size: ",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            TextSpan(
                              text: bag_item[index].itemSize,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _iconButtons(index),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey.shade600,
                    ),
                    Text(
                      "${bag_item[index].itemPrice}\$",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButtons(int index) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (bag_item[index].itemQuantity > 1) {
              bag_item[index].itemQuantity--;
              totalPrice.calculateTotalPrice(bag_item);
            }
            print(totalPrice.calculateTotalPrice(bag_item));
            print(bag_item[index].itemQuantity);

            setState(() {});
          },
          icon: const Icon(Icons.remove),
          style: _buildIconForm(),
        ),
        const SizedBox(width: 8),
        Text(
          bag_item[index].itemQuantity.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {
            bag_item[index].itemQuantity++;
            totalPrice.calculateTotalPrice(bag_item);

            setState(() {});
            // print(totalPrice
            //     .calculateTotalPrice(bag_item));
            // print(bag_item[index].itemQuantity);
          },
          icon: const Icon(Icons.add),
          style: _buildIconForm(),
        ),
      ],
    );
  }

  Widget build_checkout_section() {
    return Expanded(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total amount: "),
              Text(
                "${totalPrice.calculateTotalPrice(bag_item)}\$",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  CongratsSnackbar("Your check out is successful!", context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.grey.shade200,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "CHECK OUT",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
            ],
          )
        ],
      ),
    );
  }

  ButtonStyle _buildIconForm() {
    return IconButton.styleFrom(
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.grey.shade600,
      elevation: 2,
      shadowColor: Colors.grey.shade200,
    );
  }
}

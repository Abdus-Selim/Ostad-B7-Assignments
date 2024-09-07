import 'package:flutter/material.dart';
import 'package:module_12_assignment_app/utils/price_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PriceList priceList = PriceList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Bag",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pulloverTshirt(),
          _blackTshirt(),
          _sportDress(),
          const SizedBox(height: 200),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total amount:"),
                      Text(
                        priceList.totalPrice.toString() + "\$",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pulloverTshirt() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
          leading: Image.network(
            'https://blacknavybd.com/wp-content/uploads/2023/05/Black-oversized-tshirt-3.jpg',
            height: 100,
            width: 60,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.more_vert),
              Text(
                "\$${priceList.pulloverPrice}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          title: const Text(
            "Pullover",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text("Color: Black"),
                  SizedBox(width: 16),
                  Text("Size: L"),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (priceList.pulloverQuantity > 1) {
                          priceList.pulloverQuantity--;
                          priceList.totalPrice -= priceList.pulloverPrice;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  SizedBox(width: 16),
                  Text(priceList.pulloverQuantity.toString()),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        priceList.pulloverQuantity++;
                        priceList.totalPrice += priceList.pulloverPrice;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blackTshirt() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
          leading: Image.network(
            'https://blacknavybd.com/wp-content/uploads/2023/05/Black-oversized-tshirt-3.jpg',
            height: 100,
            width: 60,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.more_vert),
              Text(
                "${priceList.blackTshirtPrice}\$",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          title: const Text(
            "Black T-Shirt",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text("Color: Black"),
                  SizedBox(width: 16),
                  Text("Size: L"),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (priceList.blackTshirtQuantity > 1) {
                          priceList.blackTshirtQuantity--;
                          priceList.totalPrice -= priceList.blackTshirtPrice;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  SizedBox(width: 16),
                  Text(priceList.blackTshirtQuantity.toString()),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        priceList.blackTshirtQuantity++;
                        priceList.totalPrice += priceList.blackTshirtPrice;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sportDress() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
          leading: Image.network(
            'https://blacknavybd.com/wp-content/uploads/2023/05/Black-oversized-tshirt-3.jpg',
            height: 100,
            width: 60,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.more_vert),
              Text(
                "${priceList.sportDressPrice}\$",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          title: const Text(
            "Sport Dress",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text("Color: Black"),
                  SizedBox(width: 16),
                  Text("Size: M"),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (priceList.sportDressQuantity > 1) {
                          priceList.sportDressQuantity--;
                          priceList.totalPrice -= priceList.sportDressPrice;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  SizedBox(width: 16),
                  Text(priceList.sportDressQuantity.toString()),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        priceList.sportDressQuantity++;
                        priceList.totalPrice += priceList.sportDressPrice;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

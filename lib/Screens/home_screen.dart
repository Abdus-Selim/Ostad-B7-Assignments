import 'package:flutter/material.dart';
import 'package:module_12_assignment_app/utils/price_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CongratsSnackbar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  final PriceList priceList = PriceList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text(
          "My Bag",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFF9F9F9),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pulloverTshirt(),
          _blackTshirt(),
          _sportDress(),
          const SizedBox(height: 180),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _build_checkout_section(),
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
              const Icon(Icons.more_vert),
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
              const Row(
                children: [
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
                  const SizedBox(width: 16),
                  Text(priceList.pulloverQuantity.toString()),
                  const SizedBox(width: 16),
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
              const Icon(Icons.more_vert),
              Text(
                "${priceList.blackTshirtPrice}\$",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          title: const Text(
            "T-Shirt",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("Color: Grey"),
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
                  const SizedBox(width: 16),
                  Text(priceList.blackTshirtQuantity.toString()),
                  const SizedBox(width: 16),
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
              const Icon(Icons.more_vert),
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
              const Row(
                children: [
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
                  const SizedBox(width: 16),
                  Text(priceList.sportDressQuantity.toString()),
                  const SizedBox(width: 16),
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

  Widget _build_checkout_section() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total amount:"),
            Text(
              priceList.totalPrice.toString() + "\$",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFdb3121),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
          onPressed: () {
            CongratsSnackbar(
                "Congratulations! Your checkout is Done!", context);
          },
          child: const Text(
            "CHECK OUT",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

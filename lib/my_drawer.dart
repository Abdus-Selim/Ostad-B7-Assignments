import 'package:flutter/material.dart';

class my_drawer extends StatelessWidget {
  const my_drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SKILL UP NOW",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "TAP HERE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ListTile(
          leading: const Icon(
            Icons.movie_outlined,
            size: 30,
          ),
          title: const Text(
            "Episodes",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {},
        ),
        const SizedBox(height: 30),
        ListTile(
          leading: const Icon(
            Icons.info_outline,
            size: 30,
          ),
          title: const Text(
            "About",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

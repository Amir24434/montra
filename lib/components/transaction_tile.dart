import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: size.height * 0.05,
        width: size.width * 0.09,
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.yellow[700],
        ),
      ),
      title: const Text("Shopping"),
      subtitle: const Text("Buy some grocery"),
      trailing: Column(
        children: [
          const Text(
            "- \$120",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          const Text("10:00 AM"),
        ],
      ),
    );
  }
}

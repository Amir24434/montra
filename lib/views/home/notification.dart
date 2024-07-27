import 'package:flutter/material.dart';
import 'package:montra/components/transaction_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Notification"),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.more_horiz,
          )
        ],
      ),
      body: Column(
        children: [
          TransactionTile(size: size),
          TransactionTile(size: size),
          TransactionTile(size: size),
        ],
      ),
    );
  }
}

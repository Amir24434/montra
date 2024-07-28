import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BottomSheet Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 100, // Set the height of the BottomSheet
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildContainer(context, Colors.red, 'Container 1'),
                        _buildContainer(context, Colors.green, 'Container 2'),
                        _buildContainer(context, Colors.blue, 'Container 3'),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('Show BottomSheet'),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, Color color, String label) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$label clicked!'),
        ));
      },
      child: Container(
        color: color,
        width: 100, // Set the width of each container
        height: 100, // Set the height of each container
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

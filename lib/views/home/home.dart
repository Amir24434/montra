import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:montra/components/transaction_tile.dart';
import 'package:montra/utils/app_colors.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final data = <_SalesData>[
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.person,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        title: const Text(
          "Month",
          style: TextStyle(fontSize: 12),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.notification_important,
            color: Colors.purple,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.person),
                title: Center(
                  child: Text("Month"),
                ),
                trailing: Icon(
                  Icons.notification_important,
                  color: AppColors.primaryColor,
                ),
              ),
              const Text(
                "Account Balance",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                "\$9400",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.05,
                              width: size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Icon(
                                Icons.badge,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Incone",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "\$5000",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              height: size.height * 0.05,
                              width: size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: const Icon(
                                Icons.badge,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Incone",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "\$5000",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  // Chart title
                  // Enable legend

                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<_SalesData, String>>[
                    LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,

                      // Enable data label
                    )
                  ]),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Recent Transaction"),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("See all")),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TransactionTile(size: size),
              TransactionTile(size: size),
              TransactionTile(size: size),
              TransactionTile(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String? year;
  final double? sales;
}

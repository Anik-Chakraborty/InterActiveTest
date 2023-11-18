import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_grow_test/Controllers/LoginController.dart';
import 'package:it_grow_test/Controllers/TradesController.dart';
import 'package:it_grow_test/Resources/Colors.dart';
import 'package:it_grow_test/Resources/Style.dart';
import 'package:it_grow_test/Views/Widgets/TradesCard.dart';

class TradesScreen extends StatefulWidget {
  @override
  State<TradesScreen> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<TradesScreen> {
  TradesController tradesController = Get.put(TradesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        title: Text('Trade Lists', style: TxtStyle(20, white, FontWeight.w500)),
        backgroundColor: logoColor,
        actions: [
          IconButton(
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                color: white,
              ),
            ),
            onPressed: () {
              logOutUser(context);
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(
              const Duration(seconds: 2),
              () {
                tradesController.totalProfit.value = 0.0;
                setState(() {});
              },
            );
          },
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: tradesController.fetchTradesData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: grey,
                        child: Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: white),
                            child: const CircularProgressIndicator(
                              backgroundColor: transparent,
                              color: logoColor,
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      var result = snapshot.data;
                      String status = result['result'];
                      if (status == 'Error') {
                        return Center(
                          child: Text('Something Went Wrong, Try Later',
                              style: TxtStyle(20, black, FontWeight.w500)),
                        );
                      } else if (status == 'Access Denied') {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Text('Access Denied, Login Again',
                                style: TxtStyle(20, black, FontWeight.w500)),
                          ),
                        );
                      } else {
                        List data = result['data'];
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return TradesCard(
                              index: index,
                              currentPrice: data[index]['currentPrice'],
                              openPrice: data[index]['openPrice'],
                              profit: data[index]['profit'],
                              symbol: data[index]['symbol'],
                            );
                          },
                          itemCount: data.length,
                        );
                      }
                    } else {
                      return Center(
                        child: Text('Something Went Wrong, Try Later',
                            style: TxtStyle(20, black, FontWeight.w500)),
                      );
                    }
                  },
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: logoColor,
                  padding: EdgeInsets.all(10),
                  child: Obx(() => Text(
                      'Total Profit : ${tradesController.totalProfit.value}',
                      style: TxtStyle(20, white, FontWeight.w500))))
            ],
          ),
        ),
      ),
    );
  }
}

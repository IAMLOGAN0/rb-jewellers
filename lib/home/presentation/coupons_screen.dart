import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/domain/core/constants.dart';

class CouponsScreen extends StatefulWidget {
  final userId;
  final code;
  final couponRedeemed;

  const CouponsScreen(
      {super.key,
      required this.userId,
      required this.code,
      required this.couponRedeemed});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  String selectType = "1";
  final CollectionReference couponsRef =
      FirebaseFirestore.instance.collection("coupons");

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: Material(
            color: secondaryColor,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
              ),
            ),
          ),
          titleSpacing: 0,
          title: Text(
            "🎁 Your Coupons",
            style: titleText,
          ),
          backgroundColor: secondaryColor, // Customize as needed
        ),
        body: SizedBox(
          width: w,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth / 3,
                    child: InkWell(
                      onTap: () {
                        selectType = "1";
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                selectType == "1" ? Colors.red : Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            border: Border.all(
                                color: selectType == "1"
                                    ? Colors.red
                                    : secondaryColor,
                                width: 1)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w / 70),
                            child: Text(
                              "🤝 Welcome Coupon",
                              style: TextStyle(
                                  color: selectType == "1"
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 3,
                    child: InkWell(
                      onTap: () {
                        selectType = "2";
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                selectType == "2" ? Colors.red : Colors.white,
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                            border: Border.all(
                                color: selectType == "2"
                                    ? Colors.red
                                    : secondaryColor,
                                width: 1)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w / 70),
                            child: Text(
                              "🎉 Event Coupon",
                              style: TextStyle(
                                  color: selectType == "2"
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 3,
                    child: InkWell(
                      onTap: () {
                        selectType = "3";
                        setState(() {});
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                selectType == "3" ? Colors.red : Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            border: Border.all(
                                color: selectType == "3"
                                    ? Colors.red
                                    : secondaryColor,
                                width: 1)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w / 70),
                            child: Text(
                              "💎 Exclusive Coupons",
                              style: TextStyle(
                                  color: selectType == "3"
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              selectType == "1"
                  ? Padding(
                      padding: EdgeInsets.only(top: h / 3.5),
                      child: SizedBox(
                          width: w / 1.2,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/icons/ic_coupon.png",
                                width: w / 1.2,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: h / 70,
                                    ),
                                    const Text(
                                      "Welcome Bonus",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: h / 50,
                                    ),
                                    Text(
                                      "Code: || ${widget.code} ||",
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: h / 50,
                                    ),
                                    Container(
                                      height: 30,
                                      width: w / 3,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0))),
                                      child: Center(
                                        child: Text(
                                          "${widget.couponRedeemed}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  : selectType == "2"
                      ? FutureBuilder(
                          future: getEventData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final data = snapshot.data!;

                              print("data $data");
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: h / 8, right: 10.0, left: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          // Shadow color with opacity
                                          offset: const Offset(0, 4),
                                          // Horizontal and vertical offset
                                          blurRadius: 10,
                                          // Softness of the shadow
                                          spreadRadius: 2, // Size of the shadow
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 15),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0)),
                                        child: Image.network(data)),
                                  ),
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return Container();
                            }
                          })
                      : FutureBuilder<List<Map<String, dynamic>>>(
                          future: getCoupons(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text("Error: ${snapshot.error}"));
                            }
                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text("No coupons found"));
                            }

                            var coupons = snapshot.data!;

                            print("coupons$coupons");
                            return Expanded(
                              child: ListView.builder(
                                itemCount: coupons.length,
                                itemBuilder: (context, index) {
                                  var coupon = coupons[index];
                                  final userId = widget.userId.getOrElse("");
                                  List<dynamic> userList = coupon["users"];
                                  bool userCheck = false;
                                  userCheck = userList.contains(userId);

                                  bool Expired = false;
                                  if (convertData(coupon["exp_date"]) ==
                                      "Expired") {
                                    Expired = true;
                                  }
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w / 30),
                                    child: Container(
                                      height: h / 3,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              // Shadow color with opacity
                                              offset: const Offset(0, 4),
                                              // Horizontal and vertical offset
                                              blurRadius: 10,
                                              // Softness of the shadow
                                              spreadRadius:
                                                  2, // Size of the shadow
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15.0)),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w / 20),
                                        child: Column(
                                          children: [
                                            Image.network(coupon["image"],
                                                // width: 50,
                                                height: h / 4,
                                                fit: BoxFit.fill),
                                            userCheck
                                                ? Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20.0),
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        30.0))),
                                                        child: const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5.0,
                                                                  horizontal:
                                                                      20.0),
                                                          child: Text(
                                                              "Redeemed",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Expired
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 20.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            30.0))),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          5.0,
                                                                      horizontal:
                                                                          20.0),
                                                              child: Text(
                                                                  "Expired",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade600)),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              coupon["code"],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                decoration: const BoxDecoration(
                                                                    color: Colors
                                                                        .orange,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(30.0))),
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          5.0,
                                                                      horizontal:
                                                                          10.0),
                                                                  child: Text(
                                                                      "Available",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white)),
                                                                ),
                                                              ),
                                                              Text(
                                                                convertData(coupon[
                                                                    "exp_date"]),
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .grey),
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
            ],
          ),
        ));
  }

  Future getEventData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("event_coupon").get();

    if (snapshot.docs.isNotEmpty) {
      // Get first document
      var doc = snapshot.docs.first;
      print("PushKey: ${doc.id}");
      print("Image: ${doc["image"]}");

      // setState(() {
      //   imageUrl = doc["image"];
      // });

      return doc["image"];
    }
  }

  Future<List<Map<String, dynamic>>> getCoupons() async {
    QuerySnapshot snapshot = await couponsRef.get();

    return snapshot.docs.map((doc) {
      return {
        "code": doc["code"], // your custom id field
        "createdAt": doc["createdAt"],
        "exp_date": doc["exp_date"],
        "image": doc["image"],
        "users": doc["users"],
      };
    }).toList();
  }

  convertData(String date) {
    // String expDateString = "2025-08-30T00:00:00.000";
    DateTime expDate = DateTime.parse(date);
    DateTime now = DateTime.now();

    Duration diff = expDate.difference(now);
    String data = "";
    if (diff.isNegative) {
      print("Expired");
      data = "Expired";
    } else {
      int daysLeft = (diff.inHours / 24).ceil(); // ✅ rounds up
      print("Expires in $daysLeft days");
      data = "Expires in ${daysLeft} days";
    }

    return data;
  }
}

class DatabaseEvent {}
// 🤝 Welcome Coupon
// 🎉 Event Coupon
// 💎 Exclusive Coupons

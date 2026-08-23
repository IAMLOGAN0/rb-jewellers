import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../app/domain/core/constants.dart';
import '../../app/presentation/widgets/common_result_empty_widget.dart';
import '../../products/application/bloc/product_bloc.dart';
import '../domain/notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<List<Notifications>> getData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('user_notifications').get();

    return snapshot.docs
        .map((doc) => Notifications.fromMap(doc.data() as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

    return snapshot.docs
        .map((doc) => Notifications.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
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
          "Notification's List",
          style: titleText,
        ),
        backgroundColor: secondaryColor, // Customize as needed
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              if (data.isNotEmpty) {
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].title.toString() /* 'title'*/,
                                style: largeTextDark,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                              thinSpace,
                              Text(
                                data[index].message.toString() /*'message'*/,
                                style: largeTextDark,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,

                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  getTimeAgo(data[index].dateTime.toString()) /*'Date Time'*/,
                                  style: smallTextDark,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              thinSpace,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            } else {
              return SizedBox(
                height: screenHeight / 4,
                width: screenWidth,
                child: CommonResultsEmptyWidget(
                  msg: 'No Notification Found',
                  buttonHandler: () => context.read<ProductBloc>().add(
                        const ProductEvent.getProductCategories(),
                      ),
                ),
              );
            }
          }),
    );
  }

  String getTimeAgo(String utcString) {
    DateTime dateTime =
        DateTime.parse(utcString).toLocal(); // convert to local time
    return timeago.format(dateTime);
  }
}

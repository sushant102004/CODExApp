import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex/views/home/views/upcomingeventdetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('events').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return UpcomingEventWidget(
                  size: _size,
                  eventName: doc['name'],
                  date: doc['date'],
                  description: doc['description'],
                  image: doc['image'],
                  intro: doc['intro'],
                  isPastEvent: doc['isPastEvent'],
                  location: doc['location'],
                  registerLink: doc['registerLink'],
                  teamSize: doc['teamSize'],
                  timing: doc['timing'],
                  contactNumberOne: doc['contactNumberOne'],
                  contactNumberTwo: doc['contactNumberTwo'],
                  ldor: doc['ldor'],
                );
              },
            );
          }

          return Center(
            child: Image.asset(
              'assets/images/loadingBar.gif',
              width: 140,
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class UpcomingEventWidget extends StatelessWidget {
  UpcomingEventWidget(
      {Key? key,
      required Size size,
      required this.eventName,
      required this.date,
      required this.description,
      required this.image,
      required this.intro,
      required this.isPastEvent,
      required this.location,
      required this.registerLink,
      required this.teamSize,
      required this.timing,
      required this.contactNumberOne,
      required this.contactNumberTwo,
      required this.ldor})
      : _size = size,
        super(key: key);

  final Size _size;
  String eventName;
  String image;
  String intro;
  String description;
  String date;
  String timing;
  bool isPastEvent;
  String location;
  String registerLink;
  String teamSize;
  String contactNumberOne;
  String contactNumberTwo;
  String ldor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: _size.width / 40,
          right: _size.width / 40,
          top: _size.height / 120),
      child: Column(
        children: [
          Container(
            width: _size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey.shade500, blurRadius: 10)
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: () {
                Get.to(UpcomingEventDetail(
                  eventName: eventName,
                  date: date,
                  description: description,
                  image: image,
                  intro: intro,
                  isPastEvent: isPastEvent,
                  location: location,
                  registerLink: registerLink,
                  teamSize: teamSize,
                  timing: timing,
                  contactNumberOne: contactNumberOne,
                  contactNumberTwo: contactNumberTwo,
                  ldor: ldor,
                ));
              },
              child: Card(
                // color: Color(0xffd8f2ee),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height: _size.height / 2.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff377D71), width: 2),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          // child: Image.network(
                          //   image,
                          //   fit: BoxFit.fill,
                          // ),
                          child: CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                Image.asset('assets/images/loadingBar.gif'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              eventName,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Text(
                          intro,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: _size.width / 30, bottom: _size.width / 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: _size.width / 2.35,
                              decoration: BoxDecoration(
                                  color: const Color(0xff377D71),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Center(
                                  child: Text(
                                    date,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: _size.width / 2.35,
                              decoration: BoxDecoration(
                                  color: const Color(0xff377D71),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Center(
                                  child: Text(
                                    location,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

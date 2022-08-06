import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex/views/home/views/upcomingeventdetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          return const Center(
            child: Text('No Data'),
          );
        },
      ),
    );
  }
}

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
          SizedBox(
            width: _size.width,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(6),
            //     border: Border.all(color: Colors.grey.shade400)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
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
                    child: CachedNetworkImage(
                      imageUrl: image,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(_size.width / 100),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            date,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            location,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

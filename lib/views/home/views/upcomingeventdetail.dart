import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UpcomingEventDetail extends StatefulWidget {
  UpcomingEventDetail(
      {Key? key,
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
      required this.contactNumberTwo})
      : super(key: key);
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

  @override
  State<UpcomingEventDetail> createState() => _UpcomingEventDetailState();
}

class _UpcomingEventDetailState extends State<UpcomingEventDetail> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            widget.eventName,
            style: const TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(
                  left: _size.width / 40,
                  right: _size.width / 40,
                  top: _size.height / 120),
              child: Column(children: [
                SizedBox(
                  width: _size.width,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          imageUrl: widget.image,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.eventName,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Text(
                          widget.description,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Team Size: - ',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.teamSize,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Date: - ',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.date,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Timing: - ',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.timing,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Location: - ',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.location,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_size.width / 100),
                        child: SizedBox(
                          width: _size.width,
                          height: _size.height / 15,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Register Now',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}

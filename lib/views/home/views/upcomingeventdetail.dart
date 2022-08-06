import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      required this.contactNumberTwo,
      required this.ldor})
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
  String ldor;

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
                        padding: EdgeInsets.only(top: _size.height / 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.eventName,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.location,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: _size.width / 20),
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: _size.width / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Wrap(
                                      children: [
                                        ListTile(
                                          title: const Text('Date'),
                                          subtitle: Text(widget.date),
                                        ),
                                        ListTile(
                                          title: const Text('Location'),
                                          subtitle: Text(widget.location),
                                        ),
                                        ListTile(
                                          title: const Text('Timing'),
                                          subtitle: Text(widget.timing),
                                        ),
                                        ListTile(
                                          title: const Text('Team Size'),
                                          subtitle: Text(widget.teamSize),
                                        ),
                                        ListTile(
                                          title: const Text(
                                              'Last Date of Registration'),
                                          subtitle: Text(widget.ldor),
                                        ),
                                        ListTile(
                                          title: const Text('Contact Details'),
                                          subtitle: Text(
                                              widget.contactNumberOne +
                                                  ' or ' +
                                                  widget.contactNumberTwo),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              width: _size.width / 2.5,
                              height: _size.width / 7,
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade900,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  'Event Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              launchUrlString(widget.registerLink);
                            },
                            child: Container(
                              width: _size.width / 2.5,
                              height: _size.width / 7,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _size.width / 20,
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}

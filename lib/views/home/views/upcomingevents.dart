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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
              left: _size.width / 40,
              right: _size.width / 40,
              top: _size.height / 120),
          child: Column(
            children: [
              Container(
                width: _size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade400)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://scontent.fixc9-1.fna.fbcdn.net/v/t39.30808-6/278335801_5267193973346148_6227743137210123156_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=340051&_nc_ohc=OGsVLdUIAVwAX_LasOM&_nc_ht=scontent.fixc9-1.fna&oh=00_AT80EM3OIpscoYFA_iOFaBTBi_N7sANKYsRYmOnWGN_UBA&oe=62E40116',
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
                        children: const [
                          Text(
                            'War of Profit',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(_size.width / 100),
                      child: const Text(
                        '"War of Profit" is a type of business event where a person derives profit or loss by purchasing or selling their company share to other parties.',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(_size.width / 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Date: ' +
                                '30 July 2022' +
                                ' | '
                                    ' ' +
                                'Time: ' +
                                '10 - 12',
                            style: TextStyle(fontSize: 15),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(const UpcomingEventDetail());
                              },
                              child: const Text('Know More'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

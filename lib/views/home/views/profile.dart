import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: _size.width,
              height: _size.height / 4,
              decoration: const BoxDecoration(
                  color: Color(0xff377D71),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Hello👋',
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  Text(
                    'Sushant',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InformationPanel(
              size: _size,
              content: 'Sushant Dhiman',
              heading: 'Name',
            ),
            InformationPanel(
              size: _size,
              heading: 'Email',
              content: 'sushant.dhiman9812@gmail.com',
            ),
            InformationPanel(
              size: _size,
              heading: 'Phone Number',
              content: '8813951989',
            ),
            InformationPanel(
              size: _size,
              heading: 'Roll No',
              content: '11212531',
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: _size.width / 18,
                  right: _size.width / 18,
                  top: _size.height / 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          builder: (context) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Wrap(
                                children: [
                                  Container(
                                    height: 10,
                                  ),
                                  EditProfileInputField(
                                      size: _size, hintText: 'Name'),
                                  EditProfileInputField(
                                    size: _size,
                                    hintText: 'Email',
                                  ),
                                  EditProfileInputField(
                                      size: _size, hintText: 'Phone Number'),
                                  EditProfileInputField(
                                      size: _size, hintText: 'Roll No'),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: _size.width / 2.35,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff377D71),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(15),
                                            child: Center(
                                              child: Text(
                                                'Save Details',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: _size.width / 2.35,
                      decoration: BoxDecoration(
                          color: const Color(0xff377D71),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _size.width / 2.35,
                    decoration: BoxDecoration(
                        color: const Color(0xff377D71),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          'Sign Out',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _size.height / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'App Developed By ',
                  ),
                  Text(
                    'Sushant',
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InformationPanel extends StatelessWidget {
  const InformationPanel({
    Key? key,
    required Size size,
    required this.content,
    required this.heading,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String heading;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: _size.width / 25,
          left: _size.width / 35,
          right: _size.width / 35),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(heading),
          subtitle: Text(content),
        ),
      ),
    );
  }
}

class EditProfileInputField extends StatelessWidget {
  const EditProfileInputField({
    Key? key,
    required Size size,
    required this.hintText,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: _size.width / 25,
          right: _size.width / 25,
          top: _size.width / 30,
          bottom: _size.width / 30),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colors.grey.shade400, width: 1.5))),
      ),
    );
  }
}

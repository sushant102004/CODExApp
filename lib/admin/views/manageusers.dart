import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({Key? key}) : super(key: key);

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int userCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'All Users',
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return Wrap(
                            children: [
                              ListTile(
                                title: const Text('Name'),
                                subtitle: Text(doc['name']),
                              ),
                              ListTile(
                                title: const Text('Roll No'),
                                subtitle: Text(doc['rollNo']),
                              ),
                              ListTile(
                                title: const Text('Email'),
                                subtitle: Text(doc['email']),
                              ),
                              ListTile(
                                title: const Text('Phone Number'),
                                subtitle: Text(doc['phone']),
                              ),
                              ListTile(
                                title: const Text('Stream'),
                                subtitle: Text(doc['stream']),
                              ),
                            ],
                          );
                        });
                  },
                  child: ListTile(
                    title: Text(doc['name']),
                    subtitle: Text(doc['phone']),
                    trailing: Text(doc['stream']),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

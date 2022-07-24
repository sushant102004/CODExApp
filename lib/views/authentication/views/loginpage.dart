import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text(
          'CODEx',
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: EdgeInsets.only(
                left: _size.width / 30,
                right: _size.width / 30,
                top: _size.width / 30),
            child: Column(
              children: [
                HeadingAndInputField(
                    size: _size,
                    textController: nameController,
                    heading: 'Email',
                    hintText: 'eg: sushant@dhiman.com'),
                HeadingAndInputField(
                    size: _size,
                    textController: nameController,
                    heading: 'Password',
                    hintText: 'eg: aStrongPassword'),
                Padding(
                  padding: EdgeInsets.only(top: _size.height / 30),
                  child: Container(
                    width: _size.width / 2.2,
                    height: _size.height / 16,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.shade400,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class HeadingAndInputField extends StatelessWidget {
  const HeadingAndInputField({
    Key? key,
    required Size size,
    required this.textController,
    required this.heading,
    required this.hintText,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String heading;
  final String hintText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: _size.height / 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                heading,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: _size.height / 90),
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.5)),
              hintText: hintText,
            ),
          ),
        )
      ],
    );
  }
}

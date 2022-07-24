import 'package:codex/views/authentication/controller/registerpagecontroller.dart';
import 'package:codex/views/authentication/views/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final registerController = Get.put(RegisterController());
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
            child: Form(
              key: registerController.registerFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  HeadingAndInputField(
                    size: _size,
                    textController: registerController.nameController,
                    heading: 'Name',
                    hintText: 'eg: Sushant Dhiman',
                    onSaved: (value) {
                      registerController.name = value!;
                    },
                    validate: (value) {
                      return registerController.validateName(value!);
                    },
                  ),
                  HeadingAndInputField(
                    size: _size,
                    textController: registerController.emailController,
                    heading: 'Email',
                    hintText: 'eg: sushant@dhiman.com',
                    onSaved: (value) {
                      registerController.email = value!;
                    },
                    validate: (value) {
                      return registerController.validateEmail(value!);
                    },
                  ),
                  HeadingAndInputField(
                    size: _size,
                    textController: registerController.passwordController,
                    heading: 'Password',
                    hintText: 'eg: aStrongPassword',
                    onSaved: (value) {
                      registerController.password = value!;
                    },
                    validate: (value) {
                      return registerController.validatePassword(value!);
                    },
                  ),
                  HeadingAndInputField(
                    size: _size,
                    textController: registerController.rollNoController,
                    heading: 'Roll No',
                    hintText: 'eg: 11212531',
                    onSaved: (value) {
                      registerController.rollNo = value!;
                    },
                    validate: (value) {
                      return registerController.validateRollNo(value!);
                    },
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: HeadingAndInputField(
                            size: _size,
                            textController: registerController.batchController,
                            heading: 'Batch',
                            hintText: 'eg: 2021 - 2025',
                            onSaved: (value) {
                              registerController.batch = value!;
                            },
                            validate: (value) {
                              return registerController.validateBatch(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: HeadingAndInputField(
                            size: _size,
                            textController: registerController.streamController,
                            heading: 'Stream',
                            hintText: 'eg: CSE',
                            onSaved: (value) {
                              registerController.stream = value!;
                            },
                            validate: (value) {
                              return registerController.validateStream(value!);
                            },
                          ),
                        ),
                      ]),
                  Padding(
                    padding: EdgeInsets.only(top: _size.height / 30),
                    child: InkWell(
                      onTap: () {
                        registerController.register();
                      },
                      child: Container(
                        width: _size.width / 2.2,
                        height: _size.height / 16,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.shade400,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _size.height / 80),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: RichText(
                        text: const TextSpan(
                            text: "Already Have Account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                  text: " Login",
                                  style: TextStyle(color: Colors.blueAccent))
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
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
    required this.onSaved,
    required this.validate,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String heading;
  final String hintText;
  final TextEditingController textController;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validate;

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
            onSaved: onSaved,
            validator: validate,
          ),
        )
      ],
    );
  }
}

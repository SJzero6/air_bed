import 'package:air_bed/login.dart';
import 'package:flutter/material.dart';

class Regpage extends StatefulWidget {
  const Regpage({Key? key}) : super(key: key);

  @override
  State<Regpage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Regpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'AjayBedz',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Register Here',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: conpasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ));
                      // print(nameController.text);
                      // print(passwordController.text);
                    },
                  )),
              // Row(
              //   children: <Widget>[
              //     const Text('Does not have account?'),
              //     TextButton(
              //       child: const Text(
              //         'Sign in',
              //         style: TextStyle(fontSize: 20),
              //       ),
              //       onPressed: () {
              //         //signup screen
              //       },
              //     )
              //   ],
              //   mainAxisAlignment: MainAxisAlignment.center,
              // ),
            ],
          )),
    );
  }
}

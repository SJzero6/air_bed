import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget topwidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: LinearGradient(
                begin: Alignment(-0.7, -0.3),
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 172, 4, 244),
                  Color.fromARGB(255, 199, 168, 232),
                ])),
      ),
    );
  }

  static const url = 'alq5vzvrt1h0b-ats.iot.ap-northeast-1.amazonaws.com';

  static const port = 8883;

  static const clientid = 'ESP_STRUCTURE';

  final client = MqttServerClient.withPort(url, clientid, port);

  bool click = true;

  @override
  void initState() {
    _connectMQTT();
    // TODO: implement initState
  }

  _connectMQTT() async {
    await newAWSConnect();
  }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.red,
        elevation: 20,
        tooltip: 'Turn OFF',
        child: Icon(
          Icons.power_settings_new,
        ),
        onPressed: () {
          turnoff();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('turned off'),
            backgroundColor: Colors.red,
          ));
          setState(() {
            click = !click;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Color.fromARGB(255, 211, 110, 228),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.logout,
              size: 30,
              color: Color.fromARGB(255, 211, 110, 228),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 248, 248),
      body: Stack(children: [
        Positioned(top: -160, left: -30, child: topwidget(screensize.width)),
        ListView(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text('BED CONTROLLER',
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30))),
            ),
          ),
          Container(
            margin: EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //componets
                Container(
                  height: 112,
                  width: 112,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                      onTap: () {
                        print('normal bed');
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 20,
                          child: Image.asset('assets/bed 1.png'))),
                ),

                // mess
                Container(
                  height: 117,
                  width: 117,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        bedup();
                        setState(() {
                          click = !click;
                        });
                      },
                      child: Card(
                          color: (click == false) ? Colors.green : null,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 20,
                          child: Image.asset('assets/bed 2.png'))),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //componets
                Container(
                  height: 112,
                  width: 112,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                      onTap: () {
                        print('leg up');
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 20,
                          child: Image.asset('assets/bed 3.png'))),
                ),

                // mess
                Container(
                  height: 117,
                  width: 117,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                      onTap: () {
                        print('center up');
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 20,
                          child: Image.asset('assets/bed 4.png'))),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //componets
                Container(
                  height: 112,
                  width: 112,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                      onTap: () {
                        print('left hand up');
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 20,
                          child: Image.asset('assets/bed 5.png'))),
                ),

                // mess
                Container(
                  height: 117,
                  width: 117,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                      onTap: () {
                        print('right hand up');
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 20,
                          child: Image.asset('assets/bed 6.png'))),
                ),
              ],
            ),
          ),
        ]),
      ]),
    ));
  }

  Future<int> newAWSConnect() async {
    client.secure = true;

    client.keepAlivePeriod = 20;

    client.setProtocolV311();

    client.logging(on: true);

    final context = SecurityContext.defaultContext;

    ByteData crctdata =
        await rootBundle.load('assets/certs/devicectft_str.crt');
    context.useCertificateChainBytes(crctdata.buffer.asUint8List());

    ByteData authorities = await rootBundle.load('assets/certs/cacrt_str.pem');
    context.setClientAuthoritiesBytes(authorities.buffer.asUint8List());

    ByteData keybyte = await rootBundle.load('assets/certs/pvtkey_str.key');
    context.usePrivateKeyBytes(keybyte.buffer.asUint8List());
    client.securityContext = context;

    final mes =
        MqttConnectMessage().withClientIdentifier('ESP_STRUCTURE').startClean();
    client.connectionMessage = mes;
    try {
      print('MQTT client id connecting to AWS');
      await client.connect();
    } on Exception catch (e) {
      print('MQTT client connecting to AWS');
      client.disconnect();
    }
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('AWS connection success');

      const topic = 'app';
      final maker = MqttClientPayloadBuilder();
      maker.addString('bedz');

      client.subscribe(topic, MqttQos.atLeastOnce);

      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final recvmsg = c[0].payload as MqttPublishMessage;
        final ptp =
            MqttPublishPayload.bytesToStringAsString(recvmsg.payload.message);
        print(
            'Example::Change notification:: topic is<${c[0].topic}>, payload is <--$ptp-->');
      });
    } else {
      print(
          'ERROR MQTT client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
      client.disconnect();
    }
    return 0;
  }

  void bedup() {
    const topic = 'solinoid';
    final maker = MqttClientPayloadBuilder();
    maker.addString('1');

    client.publishMessage(topic, MqttQos.atLeastOnce, maker.payload!);
  }

  void turnoff() {
    const topic = 'solinoid';
    final maker = MqttClientPayloadBuilder();
    maker.addString('0');

    client.publishMessage(topic, MqttQos.atLeastOnce, maker.payload!);
  }
}

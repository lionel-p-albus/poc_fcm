import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

void onConnect(StompFrame frame) {
  stompClient.subscribe(
    destination: '/realtimePrice/B000/nio/B000-Def',
    callback: (frame) {
      // List<dynamic>? result = json.decode(frame.body!);
      print(frame.body);
    },
  );

  // Timer.periodic(const Duration(seconds: 10), (_) {
  //   stompClient.send(
  //     destination: '/app/test/endpoints',
  //     body: json.encode({'a': 123}),
  //   );
  // });
}

final stompClient = StompClient(
  config: StompConfig.SockJS(
    url: 'https://uatgwwebsocket.goldgateway.co.th/tradingwebsocket/realtime-push/realtimePrice',
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      await Future.delayed(const Duration(milliseconds: 200));
      print('connecting...');
    },
    onWebSocketError: (dynamic error) => print(error.toString()),
    stompConnectHeaders: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIwODE5MTM2MTIxIiwiRnVuY3Rpb24iOm51bGwsIlVzZXIiOiI4MjciLCJCcmFuY2giOiIxIiwiVXNlckJPIjoiNjkyIiwiVXNlclN0YXR1cyI6IkFQUFJPVkUiLCJVc2VyR3JvdXAiOiJDQzA3LTAxIiwiaXNzIjoiQm9GSUYxbUNJNldGOHhsbW9kaFVpZVNxZk9VblIwMTAiLCJleHAiOjE3MTg0NDIzMDAsIm5iZiI6MTcxODM1NTkwMCwiaWF0IjoxNzE4MzU1OTAwfQ.fr2UqEt0lOxWWL3dG7O7du3QVyQgOga_hB_RlU0IEWRsqBFga-0Tu6OqU5LEvAfB-OcPLkBt97og05Pa3Eb9Ccf7C9R0kbYUIRuvXSmZqtWvezRIcvUb27UGEyEShhTXZVZuucLv8kwxBibb9KgI4F7UuT-zyjp2xCOZ7pMCCuC_ZfMTtaRLvTe_SBV3biB6IAfYRt5CEC3qgnU9aYahKquIvaBcgrHEdiOLVcugi3ueKfDYZMrUuOB1B_RL9tmj88opj4gp1ATYkNa6uM2d1G7VWg5WNvz9iUEmKLdI4XGoU0ShbhD6WeC5RAbb-_0wj1owk-xrXYbH7YuTMXM4c2TO6wJ9oc4WXMaXIN0zEnHme5hgpSTvH6C8fWefScX3Xpnr6c-MDvPWo1rivXA3vRsixMBQbFLBmaBbXL_cjYBH11K5gPbFb0Dl9L8PQ3PFfu-C0IhNF8CccFgdJe3RYj2QQq4g6mO9oYaAt3K_6NW4BzmeIaYKzlXIsLqp2rPhXeYHDWK0_DRcb_P6yoRdPb5XWgnmSNfLX078ln2pYMhZIXDaS9xEnpMEaisQt7iaaoT_05HL9LY8qIlcBc6Gd671feJCcH-gf6vFtufd-S-1r8FBRerB7NK2QROY2It1uHjeVsSVmjfd_wjXG6u9PqZXvVZtojRzh9Xwc7N58eg'},
    webSocketConnectHeaders: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIwODE5MTM2MTIxIiwiRnVuY3Rpb24iOm51bGwsIlVzZXIiOiI4MjciLCJCcmFuY2giOiIxIiwiVXNlckJPIjoiNjkyIiwiVXNlclN0YXR1cyI6IkFQUFJPVkUiLCJVc2VyR3JvdXAiOiJDQzA3LTAxIiwiaXNzIjoiQm9GSUYxbUNJNldGOHhsbW9kaFVpZVNxZk9VblIwMTAiLCJleHAiOjE3MTg0NDIzMDAsIm5iZiI6MTcxODM1NTkwMCwiaWF0IjoxNzE4MzU1OTAwfQ.fr2UqEt0lOxWWL3dG7O7du3QVyQgOga_hB_RlU0IEWRsqBFga-0Tu6OqU5LEvAfB-OcPLkBt97og05Pa3Eb9Ccf7C9R0kbYUIRuvXSmZqtWvezRIcvUb27UGEyEShhTXZVZuucLv8kwxBibb9KgI4F7UuT-zyjp2xCOZ7pMCCuC_ZfMTtaRLvTe_SBV3biB6IAfYRt5CEC3qgnU9aYahKquIvaBcgrHEdiOLVcugi3ueKfDYZMrUuOB1B_RL9tmj88opj4gp1ATYkNa6uM2d1G7VWg5WNvz9iUEmKLdI4XGoU0ShbhD6WeC5RAbb-_0wj1owk-xrXYbH7YuTMXM4c2TO6wJ9oc4WXMaXIN0zEnHme5hgpSTvH6C8fWefScX3Xpnr6c-MDvPWo1rivXA3vRsixMBQbFLBmaBbXL_cjYBH11K5gPbFb0Dl9L8PQ3PFfu-C0IhNF8CccFgdJe3RYj2QQq4g6mO9oYaAt3K_6NW4BzmeIaYKzlXIsLqp2rPhXeYHDWK0_DRcb_P6yoRdPb5XWgnmSNfLX078ln2pYMhZIXDaS9xEnpMEaisQt7iaaoT_05HL9LY8qIlcBc6Gd671feJCcH-gf6vFtufd-S-1r8FBRerB7NK2QROY2It1uHjeVsSVmjfd_wjXG6u9PqZXvVZtojRzh9Xwc7N58eg'},
  ),
);


void main() async {
  stompClient.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

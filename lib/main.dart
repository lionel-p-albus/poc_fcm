import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'firebase_options.dart';

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


// for passing messages from event handler to the UI
final _messageStreamController = BehaviorSubject<RemoteMessage>();

// TODO: Define the background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}



void main() async {
  // TODO: active SockJS
  // stompClient.activate();

  // Set FCM
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // TODO: Request permission
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // iOS app users need to grant permission to receive messages
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  // TODO: Register with FCM
  // It requests a registration token for sending messages to users from your App server or other trusted server environment.
  String? token = await messaging.getToken();

  if (kDebugMode) {
    print('Registration Token=$token');
  }


  // TODO: Set up foreground message handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Handling a foreground message: ${message.messageId}');
      print('Message data: ${message.data}');
      print('Message notification: ${message.notification?.title}');
      print('Message notification: ${message.notification?.body}');
    }

    _messageStreamController.sink.add(message);
  });

  // TODO: Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _lastMessage = "";

  _MyHomePageState() {
    // subscribe to the message stream fed by foreground message handler
    _messageStreamController.listen((message) {
      setState(() {
        if (message.notification != null) {
          _lastMessage = 'Received a notification message:'
              '\n\nTitle=${message.notification?.title},'
              '\n\nBody=${message.notification?.body},'
              '\n\nData=${message.data}';
        } else {
          _lastMessage = 'Received a data message: ${message.data}';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Last message from Firebase Messaging:',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(_lastMessage, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

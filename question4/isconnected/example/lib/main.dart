import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:isconnected/isconnected.dart';
import 'package:isconnected/isconnected_method_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _connectionStatus = 'Unknown';
  final _isconnectedPlugin = Isconnected();
  final _eventChannel = const EventChannel('eventChannel');
  List<String> receivedValues = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _isconnectedPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventStream =
        _eventChannel.receiveBroadcastStream().distinct().map((event) {
      return event;
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Running on: $_platformVersion\n'),
              const SizedBox(height: 32),
              Text('Connection status: $_connectionStatus'),
              FilledButton(
                onPressed: () async {
                  final result =
                      await MethodChannelIsconnected().getConnectionStatus();
                  setState(() {
                    _connectionStatus = result ?? 'Unknown';
                  });
                },
                child: const Text(
                  'Click to check status',
                ),
              ),
              const SizedBox(height: 32),
              StreamBuilder(
                stream: eventStream,
                builder: (context, snapshot) {
                  debugPrint(snapshot.data);
                  final status = snapshot.data ?? 'No data';
                  return Text('Streamed status: $status');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

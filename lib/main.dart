import 'package:flutter/material.dart';

void main() {
  void sendErrorReport(FlutterErrorDetails details) {
    // Your error reporting logic
    // For example, send the error details to your server or support email
    print('Error reported: ${details.exceptionAsString()}');
  }

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool isDebug = false;
    assert(() {
      isDebug = true;
      return true;
    }());
    if (isDebug) {
      return ErrorWidget(details.exception);
    }
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 16),
          const Text(
            'Oops! Something went wrong.',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              // Implement your error reporting logic here
              // For example, send error details to a support email or backend
              sendErrorReport(details);
            },
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 1.5),
                foregroundColor: Colors.white),
            child: const Text('Send Error Report'),
          ),
        ],
      ),
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Error Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            UserName(
              //todo!! test error widget
                // userName: "khaled",
                ),
          ],
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  UserName({super.key, this.userName});
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Text(
      userName!,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

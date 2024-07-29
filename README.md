# Flutter Application

This Flutter application includes custom error handling to report issues encountered during runtime.

## Overview

The application uses a custom error widget to handle and display errors gracefully. In debug mode, errors are shown directly, while in release mode, a user-friendly error screen is displayed with an option to send an error report.

![d__flutter_linkdin Demos_friendly_error_widget_lib_doc](https://github.com/user-attachments/assets/42811df0-1741-4142-8caa-c638680cfb5e)


## Error Handling Implementation

The error handling logic is implemented in the `main.dart` file. Below is the relevant code snippet:

```dart
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

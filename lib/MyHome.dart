import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:percent_indicator/percent_indicator.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  bool webViewLoading = false;
  int progressVal = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      // body: WebView(
      //   initialUrl: "https://www.google.com",
      //   javascriptMode: JavascriptMode.unrestricted,

      //   onPageStarted: (str) {
      //     // it will run when the page will be started
      //     print("onPageStarted");
      //   },
      //   onPageFinished: (str) {
      //     // it will run when the page running is finished.
      //     print("onPageFinished");
      //   },
      //   onProgress: (progress) {
      //     // it tells the progress of the page
      //     print("onProgress $progress");
      //   },

      //   gestureNavigationEnabled:
      //       true, // it will allow usser to go back while pressing the back button
      // ),

      // stack    it is used to create boxes inside a single box

      // body: Center(
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       Container(
      //         // first box
      //         width: 200,
      //         height: 200,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         // for second boxk
      //         width: 100,
      //         height: 100,
      //         color: Colors.yellow,
      //       ),
      //     ],
      //   ),
      // ),

      body: Center(
        child: Stack(
          alignment: Alignment.center,

          // webview with stack
          children: [
            WebView(
              initialUrl: "https://www.google.com",
              javascriptMode: JavascriptMode.unrestricted,

              onPageStarted: (str) {
                // it will run when the page will be started
                print("onPageStarted");
                setState(() {
                  webViewLoading = true; // show loading when page is started
                  progressVal = 0;
                });
              },
              onPageFinished: (str) {
                // it will run when the page running is finished.
                print("onPageFinished");
                progressVal = 100;

                setState(() {
                  webViewLoading =
                      false; // circle loading sign will be hidden when page is loaded
                });
              },
              onProgress: (progress) {
                // it tells the progress of the page
                print("onProgress $progress");
                setState(() {
                  progressVal = progress;
                });
              },

              gestureNavigationEnabled:
                  true, // it will allow usser to go back while pressing the back button
            ),
            if (webViewLoading) ...[
              // Center(
              // child:
              Text(
                "$progressVal",
              ),
              CircularProgressIndicator(
                value: progressVal.toDouble() / 100,
                strokeWidth: 5,
                backgroundColor: Colors.teal,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ), // this will make circular progress progress indicator visible in the center
              // ),
            ]
          ],
        ),
      ),
    );
  }
}

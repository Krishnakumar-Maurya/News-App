import 'dart:async';
// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class ArticleView extends StatefulWidget {
//   const ArticleView({super.key, required this.BlogUrl});
//   final String BlogUrl;
//   // ArticleView({required this.BlogUrl});
//   @override
//   State<ArticleView> createState() => _ArticleViewState();
// }

// class _ArticleViewState extends State<ArticleView> {
//   final Completer<WebViewController> _completer =
//       Completer<WebViewController>();
//   @override

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text(
//               "Flutter",
//               style: TextStyle(color: Colors.blue),
//             ),
//             Text(
//               "News",
//               style: TextStyle(color: Colors.orange),
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           Opacity(
//             opacity: 0,
//             child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Icon(Icons.save)),
//           )
//         ],
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: WebView(
//           initialUrl: widget.BlogUrl,
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: ((WebViewController webViewController) {
//             setState(() {
              
//             _completer.complete(WebViewController());
//             });
//           }),
//         ),
//       ),
//     );
//   }

//   // WebView(
//   //     {required String initialUrl,
//   //     required Null Function(WebViewController webViewController)
//   //         onWebViewCreated}) {}
// }


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String BlogUrl;

  const ArticleView({Key? key, required this.BlogUrl}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Flutter"),
          Text("News",style: TextStyle(
            color: Colors.orange
          ),)
        ],
      ),
      actions: <Widget>[
        Opacity(opacity: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.save),
        ),),
        
      ],
      centerTitle: true,
      elevation: 0.0,
      ),
      body: WebView(
        initialUrl: widget.BlogUrl,
        onWebViewCreated: (WebViewController webViewController) {
          _completer.complete(webViewController);
        },
      ),
    );
  }
}


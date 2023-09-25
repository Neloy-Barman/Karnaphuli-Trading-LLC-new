import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class HomeScreen extends StatefulWidget {
  static const routeScreen = './home';

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _key = UniqueKey();
  final url = 'https://karnaphulijewellery.com/';
  late final WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(
      params,
    );

    controller
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setBackgroundColor(
        Colors.black,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            Fluttertoast.showToast(
              msg: "An error occured.",
              backgroundColor: Colors.red,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
            );
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          url,
        ),
      );
    _controller = controller;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: WebViewWidget(
        key: _key,
        controller: _controller,
      ),
    );
  }
}

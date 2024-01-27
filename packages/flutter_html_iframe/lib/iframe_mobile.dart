import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

CustomRender iframeRender({NavigationDelegate? navigationDelegate}) =>
    CustomRender.widget(widget: (context, buildChildren) {
      final sandboxMode = context.tree.element?.attributes["sandbox"];
      final UniqueKey key = UniqueKey();
      final givenWidth = double.tryParse(context.tree.element?.attributes['width'] ?? "");
      final givenHeight = double.tryParse(context.tree.element?.attributes['height'] ?? "");

      final WebViewController controller = WebViewController()
        ..setJavaScriptMode(
          sandboxMode == null || sandboxMode == "allow-scripts" ? JavaScriptMode.unrestricted : JavaScriptMode.disabled,
        )
        ..setNavigationDelegate(
          navigationDelegate ?? NavigationDelegate(),
        )
        ..loadRequest(Uri.parse(context.tree.element?.attributes['src'] ?? ""));

      return SizedBox(
        width: givenWidth ?? (givenHeight ?? 150) * 2,
        height: givenHeight ?? (givenWidth ?? 300) / 2,
        child: ContainerSpan(
          style: context.style,
          newContext: context,
          child: WebViewWidget(key: key, controller: controller),
        ),
      );
    });

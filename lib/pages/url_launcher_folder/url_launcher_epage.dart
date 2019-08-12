import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherItem {
  final String name;

  final String content;

  UrlLauncherItem(this.name, this.content);
}

Widget _urlLanucherDisplay(BuildContext context, UrlLauncherItem item) {
  return ListTile(
    title: Text("${item.name}"),
    subtitle: Text("${item.content}"),
    onTap: () {
      _launchURL(item.content);
    },
  );
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class UrlLauncherEPage extends StatefulWidget {
  @override
  _UrlLauncherEPageState createState() => _UrlLauncherEPageState();
}

class _UrlLauncherEPageState extends State<UrlLauncherEPage> {
  List<UrlLauncherItem> dataSource = [
    UrlLauncherItem('url', 'https://www.baidu.com'),
    UrlLauncherItem('email', 'mailto:smith@example.org?subject=News&body=New%20plugin'),
    UrlLauncherItem('telephone', 'tel:+8618910504647'),
    UrlLauncherItem('sms', 'sms:18910504647')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('url_launcher'),
      ),
      body: ListView.separated(
        itemCount: dataSource.length,
        itemBuilder: (context, index) =>
            _urlLanucherDisplay(context, this.dataSource[index]),
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

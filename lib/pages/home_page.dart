import 'package:flutter/material.dart';
import 'package:flutter_plugin_demo/models/frame_item.dart';
import 'package:flutter_plugin_demo/utils/key_util.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FrameItem> dataSource = [
    FrameItem('url_lanucher', 'https://pub.dev/packages/url_launcher', KeyUtil.url_launcher_example),
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: this.dataSource.length,
    //     itemExtent: 50.0,
    //     itemBuilder: (context, index) =>
    //         listItem(context, this.dataSource[index]),
    //   ),);

    // return Scaffold(
    //   appBar: AppBar(title: Text('主页'),),
    //   body: ListView.separated(
    //     itemCount: dataSource.length,
    //     itemBuilder: (context, index) {
    //       return listItem(context, this.dataSource[index]);
    //     },
    //     separatorBuilder: (context, index) => Divider(height: 8.0,),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: false,
        child: ListView.separated(
          itemCount: dataSource.length,
          itemBuilder: (context, index) {
            return listItem(context, this.dataSource[index]);
          },
          separatorBuilder: (context, index) => Divider(
            height: 8.0,
          ),
        ),
      ),
    );
  }

  Widget listItem(BuildContext context, FrameItem item) {
    return ListTile(
      title: Text("${item.name}"),
      subtitle: Text("${item.url}"),
      onTap: () {
        Navigator.of(context).pushNamed(item.example);
      },
    );
  }
}

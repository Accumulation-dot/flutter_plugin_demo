import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_plugin_demo/models/net_json_folder/net_result.dart';
import 'package:flutter_plugin_demo/models/net_json_folder/song_rank.dart';
import 'package:flutter_plugin_demo/utils/net_util.dart';
import 'package:flutter_plugin_demo/view/grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NetJsonEPage extends StatefulWidget {
  @override
  _NetJsonEPageState createState() => _NetJsonEPageState();
}

Widget songRankWidget(BuildContext context, SongRank songRank) {
  return ListTile(
    title: Text('${songRank.name}'),
    leading: CachedNetworkImage(
      imageUrl: songRank.pic_s192,
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}

Widget _showGridViewItem(BuildContext context, SongRank songRank) {
  return InkWell(
    //用inkWell是为了添加点击事件
    onTap: () {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('${songRank.count}')));
    },
    child: new Container(
      //给个0.5宽的边框
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: new Row(
        children: <Widget>[
          //一个图标
          AspectRatio(
              aspectRatio: 3,
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: songRank.pic_s210,
                placeholder: (context, url) => Center(
                  child: new CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          // new Icon(
          //   Icons.account_circle,
          //   size: 80,
          // ),
          // ),
          //一个文本
          new Container(
            padding: EdgeInsets.only(top: 10),
            child: new Text(
              songRank.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _NetJsonEPageState extends State<NetJsonEPage> {
  List<SongRank> dataSource = List();
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  void _onRefresh() async {
    dataSource.clear();

    await NetUtil()
        .requestUrl('https://api.apiopen.top/', 'musicRankings')
        .then((respond) {
      print("${respond.data}");
      try {
        var map = respond.data as Map;
        var result = NetResult.fromJson(map);
        if (result.isSuccess()) {
          var data = map['result'] as List; // as List<Map>;
          dataSource.addAll(data.map((map) => SongRank.fromJson(map)).toList());
        } else {
          print("${result.message}");
        }
      } catch (e) {
        print("${e.toString()}");
      }
    }, onError: (e) {
      print("${e.toString()}");
    });

    setState(() {});

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('net json example'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        child:
            // ListView.builder(
            //   itemCount: dataSource.length,
            //   itemBuilder: (context, index) =>
            //       songRankWidget(context, this.dataSource[index]),
            // ),
            GridView.builder(
          itemCount: dataSource.length,
          gridDelegate:
              fixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 2.0),
          itemBuilder: (BuildContext context, int index) {
            return _showGridViewItem(context, this.dataSource[index]);
          },
        ),
        onRefresh: this._onRefresh,
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
// ListView.separated(
//   shrinkWrap: true,
//   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//   itemCount: dataSource.length,
//   separatorBuilder: (context, index) => Divider(),
//   itemBuilder: (context, index) {
//     return songRankWidget(context, this.dataSource[index]);
//   },

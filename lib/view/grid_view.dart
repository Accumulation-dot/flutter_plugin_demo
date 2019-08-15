import 'package:flutter/material.dart';

/// SliverGridDelegateWithFixedCrossAxisCount 方法 那个太长了
/// crossAxisCount: ->必须 一行（列）数量
/// mainAxisSpacing: main space
/// crossAxisSpacing: 元素space
/// childAspectRatio: 元素ratio
SliverGridDelegateWithFixedCrossAxisCount fixedCrossAxisCount({
  @required crossAxisCount,
  mainAxisSpacing = 0.0,
  crossAxisSpacing = 0.0,
  childAspectRatio = 1.0,
}) {
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio);
}

SliverGridDelegateWithMaxCrossAxisExtent maxCrossAxisExtent({
  @required maxCrossAxisExtent,
  mainAxisSpacing = 0.0,
  crossAxisSpacing = 0.0,
  childAspectRatio = 1.0,
}) {
  return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: maxCrossAxisExtent,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio);
}

class GridViewPlugin {
  Widget gridCount() {
    return GridView.count(
      // key:,
      // 滚动方向
      scrollDirection: Axis.vertical,
      // 是否反转
      reverse: false,
      // 一行多少数量
      crossAxisCount: 1,
    );
  }

  /// 使用Grid
  /// Grid() 方法
  GridView gridViewDeclaration() {
    /** 一般不使用GridView 限制的条件太多 如果是确定的情况 可以使用这个 */
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1), // grid 代理 设置
    );
  }

  GridView gridViewBuilder(
      {@required SliverGridDelegate gridDelegate,
      @required IndexedWidgetBuilder itemBuilder}) {
    return GridView.builder(
      gridDelegate: gridDelegate,
      itemBuilder: itemBuilder,
      // scrollDirection: Axis.vertical,// 滚动方向 默认垂直方向
      // reverse: false, // 是否反向输出 默认false
      // controller: ScrollController(), //滚动到制定位置的控件 监听滚动事件
      // primary: false, //
      physics: BouncingScrollPhysics(),
    );
  }
  ListTile vad = ListTile();
}

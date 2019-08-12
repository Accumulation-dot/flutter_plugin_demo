import 'package:flutter/material.dart';
import 'package:flutter_plugin_demo/pages/home_page.dart';
import 'package:flutter_plugin_demo/utils/key_util.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class WelcomePage extends StatelessWidget {
//   List<Slide> slides = List();

//   void initSta

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Slide> slides = List();
  @override
  void initState() {
    super.initState();
    slides.add(Slide(
      title: '这是一个标题',
      description: 'this is the description',
      styleTitle:
          TextStyle(color: Colors.cyan, fontSize: 30.0, fontFamily: 'Raleway'),
      styleDescription:
          TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Raleway'),
      marginDescription:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
      colorBegin: Color(0xffFFDAB9),
      colorEnd: Color(0xff40E0D0),
      directionColorBegin: Alignment.topCenter,
      directionColorEnd: Alignment.bottomCenter,
    ));

    slides.add(Slide(
      title: 'second page',
      description: 'this is the second page',
      styleDescription:
          TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Raleway'),
      marginDescription:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
      colorBegin: Color(0xffFFDAB9),
      colorEnd: Color(0xff40E0D0),
      directionColorBegin: Alignment.topCenter,
      directionColorEnd: Alignment.bottomCenter,
    ));
    slides.add(Slide(
      title: 'end page',
      styleTitle:
          TextStyle(color: Colors.blue, fontSize: 25.0, fontFamily: 'Raleway'),
      description: 'this is the end page',
      styleDescription:
          TextStyle(color: Colors.red, fontSize: 20.0, fontFamily: 'Raleway'),
      marginDescription:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
      colorBegin: Color(0xffFFDAB9),
      colorEnd: Color(0xff40E0D0),
      directionColorBegin: Alignment.topCenter,
      directionColorEnd: Alignment.bottomCenter,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
        onSkipPress: this.onDonePress,
        nameSkipBtn: 'Skip',
        namePrevBtn: 'Prev',
        nameNextBtn: 'Next',
        nameDoneBtn: 'Done',
      ),
    );
  }

  /// 设置是否已经看过欢迎页
  void _setHasSkiped() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(KeyUtil.welcome_showed_key, true);
  }

  ///
  void onDonePress() {
    _setHasSkiped();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => route == null);
  }
}

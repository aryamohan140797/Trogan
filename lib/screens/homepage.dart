import 'package:flutter/material.dart';
import 'package:trogon/constants/buttons.dart';
import 'package:trogon/constants/color.dart';
import 'package:trogon/constants/padding.dart';
import 'package:trogon/constants/strings.dart';
import 'package:trogon/constants/styles.dart';
import 'package:trogon/screens/category_list.dart';
import 'package:trogon/screens/coursefull_screen.dart';

import 'couses_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppConfig _ac;
  @override
  Widget build(BuildContext context) {
    _ac=AppConfig(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        title: Image.asset("assets/images/icon.png",height: 40,width: 40,),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: _ac.rWP(4.0),right: _ac.rWP(4.0),top: _ac.rHP(4.0),
            ),
        children: [
          topCourseRow(),
          SizedBox(height: _ac.rHP(2.0),),
          Courselistview(callBack: (){

          },),
          SizedBox(height: _ac.rHP(2.0),),
          categories(),
          SizedBox(height: _ac.rHP(2.0),),
          Categorylistview()

        ],
      ),
    );
  }
Widget categories(){
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(categorie,style: Styles.Worksans(ColorTheme.black, 16.0),),
      ],
    );
}
  Widget topCourseRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(topCourses,style: Styles.Worksans(ColorTheme.black, 16.0),),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(allCourses,style: Styles.Worksans(ColorTheme.blue, 16.0),),
              Iconbuttons(
                icon: Icons.arrow_forward_ios,
                iconsize: 20.0,
                iconColor: ColorTheme.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


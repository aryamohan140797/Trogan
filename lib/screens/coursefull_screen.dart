import 'package:flutter/material.dart';
import 'package:trogon/constants/buttons.dart';
import 'package:trogon/constants/color.dart';
import 'package:trogon/constants/styles.dart';

class CourseFullView extends StatefulWidget {
  const CourseFullView({Key key, this.name}) : super(key: key);
  final String name;
  @override
  _CourseFullViewState createState() => _CourseFullViewState();
}

class _CourseFullViewState extends State<CourseFullView> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [


                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/icon.png"))),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Iconbuttons(icon: Icons.arrow_back_ios,iconsize: 25.0,iconColor: ColorTheme.black,onPressed: (){
                        Navigator.pop(context);
                      },),
                      Text(widget.name,style: Styles.Worksans(ColorTheme.black, 16.0),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Free",
                  style: Styles.Worksans(ColorTheme.black, 20.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Iconbuttons(
                  icon: Icons.share,
                  iconsize: 25.0,
                  iconColor: Colors.lightBlueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Iconbuttons(
                  icon: Icons.favorite_border,
                  iconsize: 25.0,
                  iconColor: Colors.lightBlueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.black,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.width / 5,
                  child: Center(
                    child: Text(
                      "Enroll",
                      style: Styles.Worksans(ColorTheme.white, 16.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            SizedBox(height: 10,),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size(double.infinity, 62),
                      child: AppBar(
                        backgroundColor: Colors.white,
                        bottom: TabBar(
                          unselectedLabelColor: Colors.red,
                          labelColor: Colors.red,
                          indicatorColor: Colors.red,
                          onTap: (index) {
                            tabIndex = index;
                            setState(() {});
                          },
                          tabs: [
                            Tab(
                              child: Text(
                                "Includes",
                             style: Styles.Worksans(ColorTheme.black, 14.0),
                              ),
                            ),
                            Tab(
                              child: Text(
                            "OutComes",
                                style: Styles.Worksans(ColorTheme.black, 14.0),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Requirement",
                                style: Styles.Worksans(ColorTheme.black, 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(
                      children:[
                        TabOne(),
                        TabOne(),
                        TabOne(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Center(
          child: Container(
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width/1.2,
            child: Card(
              color: ColorTheme.white,
             child: Padding(
               padding: const EdgeInsets.only(left:20.0),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(width: 20.0,),
                   Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("What is included",style: Styles.Worksans(ColorTheme.black, 14.0),),
                        Expanded(child: Iconbuttons(icon: Icons.card_giftcard,iconsize: 25.0,)),


                      ],
                    ),
                   SizedBox(height: 20,),
                   Text("49 hours of onDemand videos"),
                   SizedBox(height: 10,),
                   Divider(height: 1,thickness: 0.5,),
                   SizedBox(height: 20,),
                   Text("69 lessons"),
                   SizedBox(height: 10,),
                   Divider(height: 1,thickness: 0.5,),
                   SizedBox(height: 20,),
                   Text("High Quality videos"),
                 ],
               ),
             )
            ),
          ),
        ),
      ],
    );
  }
}


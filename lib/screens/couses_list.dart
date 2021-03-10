import 'package:flutter/material.dart';
import 'package:trogon/constants/color.dart';
import 'package:trogon/models/topcourses.dart';
import 'package:trogon/screens/coursefull_screen.dart';
import 'package:trogon/services/apis.dart';

class Courselistview extends StatefulWidget {
  const Courselistview({Key key, this.callBack}) : super(key: key);
  final Function callBack;

  @override
  _CourselistviewState createState() => _CourselistviewState();
}

class _CourselistviewState extends State<Courselistview>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: FutureBuilder<List<TopCourse>>(
        future: Apis().getCourseData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return ListView.builder(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 0),
              itemCount: snapshot.data.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CourseView(
                  id: snapshot.data[index].id,
                  title: snapshot.data[index].title,
                  callback: () {
                    widget.callBack();
                  },
                  image: snapshot.data[index].thumbnail,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CourseView extends StatelessWidget {
  const CourseView({
    Key key,
    this.callback,
    this.image,
    this.title,
    this.id,
  }) : super(key: key);

  final VoidCallback callback;
  final String image;
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 16, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Apis().coursePass(id,
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdGF0dXMiOiIxIiwiZGV2aWNlX2lkIjoiNjVmMDZjMDA3NTNmMzYwNiIsInVzZXJfaWQiOiIzNDUzIiwiZmlyc3RfbmFtZSI6IlNBRElRVUUgQUxJIiwibGFzdF9uYW1lIjoiVk0iLCJlbWFpbCI6IjkxODEyOTA0Mzc1MyIsImluc3RydWN0b3Jfb3JfdXNlciI6IjIiLCJyb2xlIjoiYWRtaW4iLCJ2YWxpZGl0eSI6MX0.sTiQpaSHIaSpV__PV-miuDLHvFLprz98W93DJ2wijxA").then((value)
{
  print("gufgvcbhka"+value.toString());
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CourseFullView(name: value[0].title,)),
  );
}
          );

        },
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(4, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 42,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 8, bottom: 8),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      title,
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: ColorTheme.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trogon/screens/homepage.dart';


class Bottomnavigation extends StatefulWidget {
  int index = 0;

  Bottomnavigation({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BottomnavigationState();
  }
}

class BottomnavigationState extends State<Bottomnavigation> {
  bool popupFlag = false;
  int currentTabIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> tabs = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  BottomnavigationState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabs.elementAt(currentTabIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.golf_course,
            ),
            title: Text(
              "Courses",
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.card_travel,
            ),
            title: Text(
              "My Courses",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 30.0,
            ),
            title: Text(
              "WishList",
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.grey,
        currentIndex: currentTabIndex,
      ),
    );
  }
}


// class HealthMonitorScreen extends StatefulWidget {
// @override
// _HealthMonitorScreenState createState() => _HealthMonitorScreenState();
// }
//
// class _HealthMonitorScreenState extends State<HealthMonitorScreen>
//     with SingleTickerProviderStateMixin {
//   int tabIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 23,
//           ),
//           Center(
//             child: Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 5),
//               child: Text(
//                 "${AppLocalizations.of(context).locale.languageCode=="en"?
//                 context.watch<ProfileDataProvider>().mProfileModel.firstName+"'s":""} "
//                     "${AppLocalizations.of(context).translate("health_monitor_title")}"
//                     "${AppLocalizations.of(context).locale.languageCode=="fr"?" de "+
//                     context.watch<ProfileDataProvider>().mProfileModel.firstName:""}",
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline1
//                     .copyWith(color: ColorConstants.inverseTextColor),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 32,
//           ),
//           Flexible(
//             flex: 1,
//             fit: FlexFit.tight,
//             child: ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//               child: DefaultTabController(
//                 length: 2,
//                 child: Scaffold(
//                   appBar: PreferredSize(
//                     preferredSize: Size(double.infinity, 62),
//                     child: AppBar(
//                       backgroundColor: Colors.white,
//                       bottom: TabBar(
//                         unselectedLabelColor: ColorConstants.defaultTextColor,
//                         labelColor: ColorConstants.locationColor,
//                         indicatorColor: ColorConstants.locationColor,
//                         onTap: (index) {
//                           tabIndex = index;
//                           setState(() {});
//                         },
//                         tabs: [
//                           Tab(
//                             child: Text(
//                               AppLocalizations.of(context).translate("track"),
//                               style: GoogleFonts.openSans(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           Tab(
//                             child: Text(
//                               AppLocalizations.of(context).translate("history"),
//                               style: GoogleFonts.openSans(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   body: TabBarView(
//                     children: [HealthMonitorTrack(), HealthMonitorHistory()],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Theme.of(context).primaryColor,
//       centerTitle: true,
//       title: Container(
//         height: 25,
//         child: Center(
//           child: SvgPicture.asset(
//             'assets/icons/bayshore_healthcare_logo_en.svg',
//             fit: BoxFit.scaleDown,
//             color: ColorConstants.inverseTextColor,
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         InkWell(
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => NotificationCenterScreen()));
//           },
//           child: Container(
//               padding: EdgeInsets.only(right: 10, left: 10),
//               child: Icon(
//                 Icons.notifications,
//                 color: ColorConstants.inverseTextColor,
//               )),
//         )
//       ],
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> eventTitlesList = [
    "Flutter Interact",
    "College football event...",
    "Another football event...",
  ];

  List<String> eventDateList = [
    "11 December 2019",
    "22 December 2019",
    "23 December 2019",
  ];

  List<String> eventImagesUrlList = [
    "https://developers.google.com/events/flutter-interact/images/flutter-interact-social.png",
    "https://images.pexels.com/photos/2263436/pexels-photo-2263436.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/2774556/pexels-photo-2774556.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
  ];

  List<String> nearbyEventTitlesList = [
    "Nearby Event 1...",
    "Nearby Event 2...",
    "Nearby Event 3...",
    "Nearby Event 4...",
  ];

  List<String> nearbyEventDateList = [
    "22 December 2019",
    "23 December 2019",
    "24 December 2019",
    "25 December 2019",
  ];

  List<String> nearbyEventImagesUrlList = [
    "https://images.pexels.com/photos/2747449/pexels-photo-2747449.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/518389/pexels-photo-518389.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/3023317/pexels-photo-3023317.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/2311713/pexels-photo-2311713.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 "
  ];

  // **************************BuildContainer********************
  Widget buildContainer({@required IconData icon, @required String title}) {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          color: Color(0xFFE6ECF0), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Color(0xFF7540EE),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 16.0, color: Color(0xFF5C5C5C)),
          ),
        ],
      ),
    );
  }

//  **************************BuildEvents*********************
  Widget buildEvents(
      {@required String heading,
      @required List<String> imgURL,
      @required List<String> eventDate,
      @required List<String> eventTitle}) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$heading",
            style: TextStyle(fontSize: 25.0),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: eventTitle.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10.0, right: 10.0),
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.black45,
                          image: DecorationImage(
                              image: NetworkImage(
                                "${imgURL[index]}",
                              ),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${eventDate[index]}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("${eventTitle[index]}",
                        style: TextStyle(
                          color: Color(0xAA5C5C5C),
                          fontSize: 16.0,
                        )),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Events",
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Chandigarh, IN",
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF5C5C5C)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CupertinoTextField(
              placeholder: "Search",
              prefix: Icon(Icons.search),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Color(0xFFF4F6F5),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF7541EE),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: RotatedBox(
                        child: Text(
                          "All Events",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
                        quarterTurns: 3,
                      ),
                    ),
                  ),
                  buildContainer(icon: Icons.mic_none, title: "Concerts"),
                  buildContainer(icon: Icons.directions_bike, title: "Sports"),
                  buildContainer(icon: Icons.cake, title: "Birthday"),
                  buildContainer(icon: Icons.fitness_center, title: "Fitness"),
                ],
              ),
            ),
          ),
          buildEvents(
              heading: "Popular Events",
              eventTitle: eventTitlesList,
              eventDate: eventDateList,
              imgURL: eventImagesUrlList),
          buildEvents(
              heading: "Nearby Events",
              eventTitle: nearbyEventTitlesList,
              eventDate: nearbyEventDateList,
              imgURL: nearbyEventImagesUrlList)
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xAA7541EE),
        unselectedItemColor: Color(0x99565656),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.location_searching, size: 30),
              title: Text(
                "Discover",
                style: TextStyle(fontSize: 16.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note, size: 30),
              title: Text(
                "Tickets",
                style: TextStyle(fontSize: 16.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              title: Text(
                "Search",
                style: TextStyle(fontSize: 16.0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 16.0),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:health_care/widgets/moods.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import './util.dart';
import './style_guide.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MyHomePage(),
      ),
    );

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _buildBackgroundCover(),
                _buildGreetings(),
                _buildMoodsHolder(),
              ],
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  _buildNotificationCard(),
                  _buildNextAppoinmentTitle("Your Next Appoinment"),
                  _buildNextAppoinmentInfo(),
                  _buildNextAppoinmentTitle("Specialist in Your Area"),
                  _buildAreaSpecialists(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.home,
              size: 30,
            ),
            title: Text("1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.search,
              size: 30.0,
            ),
            title: Text("1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.gratipay,
              size: 30,
            ),
            title: Text("1"),
          ),
        ],
        onTap: onTapped,
      ),
    );
  }

  _buildBackgroundCover() {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  _buildGreetings() {
    return Positioned(
      left: 20.0,
      bottom: 90.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi Dan',
            style: greetingTitleStyle,
          ),
          SizedBox(height: 10),
          Text(
            'How are you feeling today?',
            style: greetingSubtitleStyle,
          ),
        ],
      ),
    );
  }

  _buildMoodsHolder() {
    return Positioned(
      bottom: -45,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(10),
          borderRadius: BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, spreadRadius: 5.5, blurRadius: 5.5),
          ],
        ),
        child: Moods(),
      ),
    );
  }

  _buildNotificationCard() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          LineAwesomeIcons.calendar_check_o,
          color: Colors.white,
          size: 32,
        ),
        title: Text(
          "You visit with \nDr. Mukomberoh",
          style: notificationTitleStyle,
        ),
        trailing: OutlineButton(
          onPressed: () {},
          color: Colors.transparent,
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: Text(
            "Review & Add Notes",
            style: notificationButtonStyle,
          ),
        ),
      ),
    );
  }

  _buildNextAppoinmentTitle(title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: nextAppoinmentTitleStyle,
          ),
          Text(
            "See All",
            style: nextAppoinmentSubtitleStyle,
          ),
        ],
      ),
    );
  }

  _buildNextAppoinmentInfo() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 18.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(USER_IMAGE),
                radius: 36,
              ),
              SizedBox(width: 12),
              RichText(
                text: TextSpan(
                  text: "Dr. Handi Cloak",
                  style: appoinmentMainStyle,
                  children: [
                    TextSpan(
                      text: '\nSunday. May 5th at 8:00 am',
                      style: appoinmentDateStyle,
                    ),
                    TextSpan(
                      text: '\n570 Kyemmer Stores \nNairobi Kenya -C 4 Avenue',
                      style: appoinmentVenueStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Divider(
            color: Colors.grey[200],
            height: 3.0,
            thickness: 1,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _iconBuilder(LineAwesomeIcons.check_circle, 'Check In'),
              _iconBuilder(LineAwesomeIcons.times_circle, 'Cancel'),
              _iconBuilder(LineAwesomeIcons.calendar_times_o, 'Calendar'),
              _iconBuilder(LineAwesomeIcons.compass, 'Directions'),
            ],
          ),
        ],
      ),
    );
  }

  _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  _buildAreaSpecialists() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 6.0),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(USER_IMAGE),
                radius: 36,
              ),
              SizedBox(width: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'wellness\n',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: 'Dr Ayor Kruger',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\nPopular Pharma Limited',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '\nDermatologist\nSAn Franscisco CA | 5 min',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.0),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: purpleGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(80.0),
                        ),
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: 36,
                          minWidth: 88,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Book Visit',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              Icon(
                LineAwesomeIcons.heart,
                color: lightColor,
                size: 40,
              )
            ],
          ),
        ],
      ),
    );
  }
}

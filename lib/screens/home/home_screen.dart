import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/my_header_drawer.dart';
import 'package:plant_app/screens/contact_us.dart';
import 'package:plant_app/screens/features_an_services.dart';
import 'package:plant_app/screens/home/components/body.dart';
import 'package:plant_app/screens/our_resume.dart';

import '../about_us.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var currentpage = drawerSections.Home_page;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentpage == drawerSections.Home_page) {
      container = Body();
    } else if (currentpage == drawerSections.about_us) {
      container = AboutUs();
    } else if (currentpage == drawerSections.features_and_services) {
      container = FeaturesAndServices();
    } else if (currentpage == drawerSections.our_resume) {
      container = OurResume();
    } else if (currentpage == drawerSections.contact_us) {
      container = ContactUs();
    }

    return Scaffold(
      appBar: buildAppBar(),
      body: container,

      // (Fiverr): Scaffold itself has the Drawer option.
      //           Because you already have a Listview, the SingleChildScrollView
      //           is not needed.
      drawer: Drawer(
        child: ListView(
          children: [
            MyHeaderDrawer(),
            MyDrawerList(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: Builder(
        builder: (context) {
          // (Fiverr): Here you called the drawer. Thats wrong, but if you want a
          //           other image, you could call "openDrawer"
          return IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
    );
  }
}

// (Fiverr): You should prefer Widgets instead of methods
class MyDrawerList extends StatefulWidget {
  const MyDrawerList({Key key}) : super(key: key);

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, 'Home page', Icons.home_rounded,
              currentpage == drawerSections.Home_page ? true : false, context),
          menuItem(2, 'About us', Icons.contacts,
              currentpage == drawerSections.about_us ? true : false, context),
          menuItem(
              3,
              'Features & services',
              Icons.dashboard_outlined,
              currentpage == drawerSections.features_and_services
                  ? true
                  : false,
              context),
          menuItem(4, 'Our resume', Icons.import_contacts_outlined,
              currentpage == drawerSections.our_resume ? true : false, context),
          menuItem(5, 'Contact us', Icons.people_alt_outlined,
              currentpage == drawerSections.contact_us ? true : false, context),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected,
      BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentpage = drawerSections.Home_page;
            } else if (id == 2) {
              currentpage = drawerSections.about_us;
            } else if (id == 3) {
              currentpage = drawerSections.features_and_services;
            } else if (id == 4) {
              currentpage = drawerSections.our_resume;
            } else if (id == 5) {
              currentpage = drawerSections.contact_us;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum drawerSections {
  Home_page,
  about_us,
  features_and_services,
  our_resume,
  contact_us
}

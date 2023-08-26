import 'package:flutter/material.dart';
import 'package:oeber/methods/auth_methods.dart';
import 'package:oeber/widgets/back_arrow.dart';

class ProfileHomeScreen extends StatefulWidget {
  const ProfileHomeScreen({super.key});

  @override
  State<ProfileHomeScreen> createState() => _ProfileHomeScreenState();
}

class _ProfileHomeScreenState extends State<ProfileHomeScreen> {
  //------------------------------Widget Rendering------------------------------\\

  Widget renderProfilePicture() {
    return const Center(
      child: Padding(
          padding:
              EdgeInsets.only(top: 0.0, left: 50.0, right: 50.0, bottom: 30.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiYXE8Ek1M_tOGkdTGsgLwLQe3UPdBMGcfYg&usqp=CAU"),
            radius: 90,
          )),
    );
  }

  Widget renderBackArrow() {
    return const BackArrow();
  }

  Widget renderName(String header) {
    return Text(
      header,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget renderManageNotifications() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, left: 14.0, right: 50.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(Icons.notifications),
            VerticalDivider(
              width: 22,
            ),
            Text(
              "Notification",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            VerticalDivider(
              width: 218,
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget renderManagePayments() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, left: 14.0, right: 50.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(Icons.payment),
            VerticalDivider(
              width: 22,
            ),
            Text(
              "Payments",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            VerticalDivider(
              width: 232,
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget renderManageSecurity() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, left: 14.0, right: 50.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(Icons.security),
            VerticalDivider(
              width: 22,
            ),
            Text(
              "Security",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            VerticalDivider(
              width: 246,
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget renderHelpCenter() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, left: 14.0, right: 50.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(Icons.help_center),
            VerticalDivider(
              width: 22,
            ),
            Text(
              "Help Center",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            VerticalDivider(
              width: 216,
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget renderInviteFriends() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, left: 14.0, right: 50.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(Icons.group),
            VerticalDivider(
              width: 22,
            ),
            Text(
              "Invite Friends",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            VerticalDivider(
              width: 202,
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget renderRateUs() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.0, left: 14.0, right: 50.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(Icons.star),
            VerticalDivider(
              width: 22,
            ),
            Text(
              "Rate Us",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            VerticalDivider(
              width: 247,
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget renderLogOut() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 15.0, right: 50.0, bottom: 10.0),
        child: GestureDetector(
          onTap: () {
            signOut(context);
          },
          child: const Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.red,
              ),
              VerticalDivider(
                width: 22,
              ),
              Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              VerticalDivider(
                width: 247,
              ),
              //Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
    );
  }

  //-------------------------------------------------------------------------\\

  //-----------------------------Functionality-------------------------------\\

  //TODO: insert log out method
//-------------------------------------------------------------------------\\

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            renderBackArrow(),
            renderProfilePicture(),
            Column(
              children: [
                renderName("John Doe"),
                const Divider(
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                ),
                renderManageNotifications(),
                renderManagePayments(),
                renderManageSecurity(),
                renderHelpCenter(),
                renderInviteFriends(),
                renderRateUs(),
                renderLogOut(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

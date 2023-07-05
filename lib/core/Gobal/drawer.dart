import 'package:earnest_task/core/Gobal/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomDrawer extends GetView {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.75,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                // /color: neutral,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome to Earnest talk' ,
                          style: TextStyle(
                            fontFamily: Customfont.din,
                            fontSize: 24,
                          ),)
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.dashboard,
            ),
            horizontalTitleGap: 0,
            title: const Text('Dashboard', ),
            onTap: () {
              Get.back();
              // Get.toNamed(Routes.login);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1, ),
            horizontalTitleGap: 0,
            title:  Text('Edit Profile', style: TextStyle( fontFamily: Customfont.din),),
            onTap: () {
              Get.back();
              // Get.toNamed(Routes.sign);
            },
          ),

           ListTile(
            leading: const Icon(Icons.settings,  ),
            horizontalTitleGap: 0,
            title:  Text('Setting',style: TextStyle( fontFamily: Customfont.din),),
          ),

           ListTile(
            leading: const Icon(Icons.exit_to_app, ),
            minLeadingWidth: 5,
            title: Text('Logout', style: TextStyle( fontFamily: Customfont.din),),

          ),
        ],
      ),
    );
  }
}
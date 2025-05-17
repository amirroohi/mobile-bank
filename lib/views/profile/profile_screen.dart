import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../home/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("پروفایل", style: TextStyle(fontSize: 28))),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home,size: 32,),
                tooltip: 'خانه',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
          ],
          leading: SizedBox(width: 0),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 340,
                  width: double.infinity,
                  color: AppColors.white,
                ),
                Container(height: 250, color: AppColors.primary),

                Positioned(
                  top: 75,
                  left: 15,
                  right: 15,
                  child: Directionality(
                    textDirection: TextDirection.rtl,

                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 250,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'کاربر تست',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                          'ایمیل:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('m@yahoo.com'),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                          'تاریخ تولد:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('1370/09/27'),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                          'کد ملی:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('0480383650'),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text(
                                          'شماره تماس:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('09121250058'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromRGBO(251, 238, 255, 1.0),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ..._settingsTiles(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _settingsTiles(BuildContext context) {
    return [
      _settingsTile(Icons.lock, 'تغییر رمز عبور', onTap: () {}),
      _settingsSwitchTile(
        Icons.dark_mode,
        'تغییر تم',
        value: false,
        onChanged: (val) { return !val; },
      ),
      _settingsTile(Icons.star, 'مدیریت خدمات برگزیده', onTap: () {}),
      _settingsTile(Icons.list, 'فهرست منتخب', onTap: () {}),
      _settingsTile(
        Icons.power_settings_new,
        'خروج',
        onTap: () {},
        color: Colors.red,
        iconColor: Colors.red,
      ),
    ];
  }

  Widget _settingsTile(
    IconData icon,
    String title, {
    VoidCallback? onTap,
    Color? color,
    Color? iconColor,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Material(
          elevation: 0,
          borderRadius: BorderRadius.circular(25),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            tileColor: Color.fromRGBO(241, 241, 241, 1.0),
            leading: Icon(icon, color: color ?? Colors.black),
            title: Text(title, style: TextStyle(color: color ?? Colors.black)),
            trailing: const Icon(Icons.arrow_forward),
            onTap: onTap,
            iconColor: iconColor,
          ),
        ),
      ),
    );
  }

  Widget _settingsSwitchTile(
    IconData icon,
    String title, {
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SwitchListTile(
          activeTrackColor: Colors.green,
          activeColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          tileColor: Color.fromRGBO(236, 236, 236, 1.0),
          secondary: Icon(icon),
          title: Text(title),
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

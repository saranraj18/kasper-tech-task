import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kasper_tech_task/helpers/custom_button.dart';
import 'package:kasper_tech_task/helpers/text_field_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final TextEditingController _nameCtrl =
          TextEditingController(text: "Dhairya Patel"),
      _addressCtrl = TextEditingController(text: "Museum Circle, Bikaner"),
      _mobileCtrl = TextEditingController(text: "98765 43210");

  final String _fromName = "Krishna Ojha",
      _fromAddress = "Ojha Bhavan, Civil Lines, Bikaner",
      _status = "";

  @override
  void initState() {
    super.initState();

    // Initializing Flutter Local Notifications
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = const IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);
  }

  // Setting up onClick Functionality for Local Notifications
  Future onSelectNotification(String? payload) {
    debugPrint("payload : $payload");
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Notification'),
          content: Text('$payload'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // UI for Home Page
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        leadingWidth: width * 0.15,
        toolbarHeight: height * 0.1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // UI for Current Tasks
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.07),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: width * 0.008,
                ),
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              margin: EdgeInsets.symmetric(horizontal: width * 0.015),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.045,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.045),
                  Text(
                    "Current Task",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: height * 0.02),
                  TextField(
                    controller: _nameCtrl,
                    decoration: TextFieldDecoration.rRectDecoration(
                      width: width,
                      label: 'Name',
                      fillColor: Colors.white,
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: height * 0.025),
                  TextField(
                    controller: _addressCtrl,
                    decoration: TextFieldDecoration.rRectDecoration(
                      width: width,
                      label: 'Address',
                      fillColor: Colors.white,
                    ).copyWith(
                      suffixIcon: Icon(
                        Icons.map,
                        color: Colors.black,
                        size: width * 0.05,
                      ),
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: height * 0.025),
                  TextField(
                    controller: _mobileCtrl,
                    decoration: TextFieldDecoration.rRectDecoration(
                      width: width,
                      label: 'Mobile No.',
                      fillColor: Colors.white,
                    ).copyWith(
                      suffixIcon: Icon(
                        Icons.phone,
                        color: Colors.black,
                        size: width * 0.05,
                      ),
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: height * 0.025),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.47,
                        child: Text(
                          "From: $_fromName\n$_fromAddress",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      SmallButton(
                        name: "Status",
                        onPressed: () {
                          showNotification();
                        },
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.035),
                ],
              ),
            ),
            SizedBox(height: height * 0.045),

            // UI for Upcoming Tasks
            Text(
              "Upcoming Task",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(height: height * 0.025),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.07),
                borderRadius: BorderRadius.circular(width * 0.04),
              ),
              margin: EdgeInsets.symmetric(horizontal: width * 0.015),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.045,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.03),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Tilak Nagar, Bikaner",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const Icon(Icons.arrow_downward_rounded),
                          Text(
                            "MP Colony, Bikaner",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                      SmallButton(
                        name: "Start",
                        onPressed: () {
                          showNotification();
                        },
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Functionality for Showing Notification
  showNotification() async {
    var android = const AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'CHANNEL DESCRIPTION',
      priority: Priority.high,
      importance: Importance.max,
    );
    var iOS = const IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'New Ride', 'A new ride is available', platform);
  }
}

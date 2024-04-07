import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/bloc/notifications/notifications_cubit.dart';
import 'package:flutter_coffee/bloc/notifications/notifications_state.dart';
import 'package:flutter_coffee/components/header.dart';
import 'package:flutter_coffee/components/notification_item.dart';
import 'package:flutter_coffee/components/spin.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>().loadNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Header(),
                      const SizedBox(height: 30,),
                      const Text('Notifications: ', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFFFFFFFF), fontSize: 14.0),),
                      const SizedBox(height: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // children: state.notifications.map((notification) => 
                        //   NotificationItem(
                        //     title: notification['title'],
                        //     date: notification['date'],
                        //     time: notification['time'],
                        //   ),
                        // ).toList(),
                        children: state.isLoading == true ? 
                          [const Spin()] : 
                          state.notifications.isEmpty ? 
                          [const Text('No notifications', style: TextStyle(fontFamily: 'Rosarivo', color: Color(0xFFFFFFFF), fontSize: 14.0),),] : 
                          state.notifications.map((notification) => 
                            NotificationItem(
                              title: notification['title'],
                              date: notification['date'],
                              time: notification['time'],
                            ),
                          ).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
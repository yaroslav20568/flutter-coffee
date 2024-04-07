import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/bloc/notifications/notifications_state.dart';
import 'package:flutter_coffee/constants.dart';
import 'package:http/http.dart' as http;

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState(isLoading: false, notifications: []));

  Future<void> loadNotifications() async {
    emit(NotificationsState(isLoading: true, notifications: []));
    var response = await http.get(Uri.parse('$urlApi/notifications'));
    var notifications = await json.decode(response.body);
    emit(NotificationsState(isLoading: false, notifications: notifications));
  }
}
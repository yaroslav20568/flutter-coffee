import 'package:equatable/equatable.dart';

class NotificationsState extends Equatable {
  bool? isLoading;
  List<dynamic> notifications;

  NotificationsState({this.isLoading, required this.notifications});

  @override
  List<dynamic> get props => [this.isLoading, this.notifications];
}
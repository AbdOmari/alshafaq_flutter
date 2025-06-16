import 'package:ashafaq/features/chat/presentation/screens/chats_screen.dart';
import 'package:ashafaq/features/home/presentation/screens/home_screen.dart';
import 'package:ashafaq/features/request/presentation/screens/request_screen.dart';
import 'package:ashafaq/features/subscriptions/presentation/screens/subscriptions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  navigateTo(int index) => emit(index);

  init() => emit(0);
}

const List<String> homeRoutes = [
  HomeScreen.pageRoute,
  RequestScreen.pageRoute,
  SubscriptionsScreen.pageRoute,
  ChatsScreen.pageRoute,
];

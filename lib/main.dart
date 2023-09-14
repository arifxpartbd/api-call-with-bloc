import 'package:apicallwithbloc/blocs/post_bloc/post_bloc.dart';
import 'package:apicallwithbloc/blocs/task_bloc/task_bloc.dart';
import 'package:apicallwithbloc/blocs/user_bloc/user_bloc.dart';
import 'package:apicallwithbloc/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(create: (_)=>UserBloc()),
          BlocProvider<PostBloc>(create: (_)=>PostBloc()),
          BlocProvider<TaskBloc>(create: (_)=>TaskBloc()),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ));
  }
}

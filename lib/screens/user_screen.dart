import 'package:apicallwithbloc/blocs/user_bloc/user_bloc.dart';
import 'package:apicallwithbloc/blocs/user_bloc/user_event.dart';
import 'package:apicallwithbloc/blocs/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(FetchUserData());
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List Screen'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state){
          if(state is UserDataLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is UserDataError){
            return Center(child: Text(state.error),);
          }
          if(state is UserDataLoaded){
            final user = state.user;
            return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index){
                  final userinfo = user[index];
              return ListTile(
                title: Text('User Name: ${userinfo.name}'),
                subtitle: Text('Email: ${userinfo.address?.city ?? "No found city"}'),

              );
            });
          }else{
            return const Center(child: Text('Error: No Data Found'),);
          }
        },),
    );
  }
}

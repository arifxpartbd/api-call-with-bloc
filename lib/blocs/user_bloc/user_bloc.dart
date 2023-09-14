
import 'package:apicallwithbloc/api_service.dart';
import 'package:apicallwithbloc/blocs/user_bloc/user_event.dart';
import 'package:apicallwithbloc/blocs/user_bloc/user_state.dart';
import 'package:apicallwithbloc/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  ApiCall apiCall = ApiCall();
  UserBloc():super(UserInitialData());

 @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
   if(event is FetchUserData){
     yield UserDataLoading();

     try{
       final users = await apiCall.getUser();
       final user = users.map((e) => UserModel.fromJson(e)).toList();

       yield UserDataLoaded(user);
     }catch(e){
       throw Exception (e.toString());
     }
   }
  }
}
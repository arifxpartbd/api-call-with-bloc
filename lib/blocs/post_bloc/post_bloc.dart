
import 'package:apicallwithbloc/api_service.dart';
import 'package:apicallwithbloc/blocs/post_bloc/post_event.dart';
import 'package:apicallwithbloc/blocs/post_bloc/post_state.dart';
import 'package:apicallwithbloc/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState>{

  final ApiCall _apiCall = ApiCall();
  PostBloc():super(PostInitial());


  @override
  Stream<PostState> mapEventToState(PostEvent event)async*{

    if(event is FetchPostData){
      yield PostLoading();
      try{
        final post = await _apiCall.getPost();
        final postList = post.map((e) => PostModel.fromJson(e)).toList();

        yield PostDataLoaded(postList);

      }catch(e){
        throw Exception(e.toString());
      }
    }

  }
}

import 'package:apicallwithbloc/api_service.dart';
import 'package:apicallwithbloc/blocs/task_bloc/task_event.dart';
import 'package:apicallwithbloc/blocs/task_bloc/task_state.dart';
import 'package:apicallwithbloc/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState>{

  final ApiCall _apiCall = ApiCall();
  TaskBloc():super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event)async*{
    if(event is TaskFetch){
      yield TaskLoading();
      try{
        final task = await _apiCall.getTask();
        final taskList = task.map((e) => TaskModel.fromJson(e)).toList();
        final taskCompleted = taskList.where((element) => element.completed == true).toList();
        final taskInCompleted = taskList.where((element) => element.completed == false).toList();
        yield TaskLoaded(taskList, taskInCompleted, taskCompleted);
      }catch(e){
        throw Exception(e.toString());
      }
    }
  }

}
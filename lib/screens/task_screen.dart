import 'package:apicallwithbloc/blocs/task_bloc/task_bloc.dart';
import 'package:apicallwithbloc/blocs/task_bloc/task_event.dart';
import 'package:apicallwithbloc/blocs/task_bloc/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(TaskFetch());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Completed'),
            Tab(text: 'InCompleted'),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TaskError) {
              return const Center(child: Text('Error Found'));
            }
            if (state is TaskLoaded) {
              return TabBarView(
                controller: _tabController,
                children: [

                  _completedTask(state.taskCompleted),
                  _completedTask(state.taskIncompleted),

                   // Corrected function name
                ],
              );
            } else {
              return const Center(child: Text('Error found'));
            }
          },
        ),
      ),
    );
  }

  Widget _completedTask(List<TaskModel> task) {
    return ListView.builder(
      itemCount: task.length,
      itemBuilder: (context, index) {
        final tasklist = task[index];
        return ListTile(
          title: Text(tasklist.title.toString()),
          subtitle: Text(tasklist.userId.toString()),
          trailing: tasklist.completed == true ? const Icon(Icons.history) : const Icon(Icons.done),
        );
      },
    );
  }
}

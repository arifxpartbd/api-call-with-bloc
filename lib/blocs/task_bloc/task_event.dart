
import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable{

}

class TaskFetch extends TaskEvent{
  @override
  List<Object?> get props =>[];

}
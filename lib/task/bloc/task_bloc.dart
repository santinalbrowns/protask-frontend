import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:protask/models/models.dart';
import 'package:protask/repo/task_repo.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(this.taskRepo) : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final TaskRepo taskRepo;
}

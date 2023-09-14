import 'package:apicallwithbloc/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitialData extends UserState {}

class UserDataLoading extends UserState {}

class UserDataError extends UserState {
  final String error;
  UserDataError(this.error);

  @override
  List<Object?> get props => [error];
}

class UserDataLoaded extends UserState {
  final List<UserModel> user;
  UserDataLoaded(this.user);
  @override
  List<Object?> get props => [user];
}

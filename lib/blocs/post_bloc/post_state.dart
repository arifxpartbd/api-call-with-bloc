import 'package:equatable/equatable.dart';

import '../../models/post_model.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostDataLoaded extends PostState {
  final List<PostModel> post;
  PostDataLoaded(this.post);
  @override
  List<Object?> get props => [post];
}

class PostDateError extends PostState {
  final String error;
  PostDateError(this.error);
  @override
  List<Object?> get props => [error];
}

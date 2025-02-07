part of 'post_bloc.dart';

sealed class PostState {}

class PostsInitial extends PostState {}

class PostsLoading extends PostState {}

class PostsLoaded extends PostState {
  PostsLoaded({required this.response});
  final List<Post?> response;
}

class PostsError extends PostState {
  PostsError({required this.error});
  final String error;
}

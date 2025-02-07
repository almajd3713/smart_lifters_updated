import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:smart_lifters/src/db/schemas/post/post.dart';
import 'package:smart_lifters/src/db/schemas/post/post_repo.dart';


part 'post_event.dart';
part 'post_state.dart';

class PostsBloc extends Bloc<PostEvent, PostState> {
  PostsBloc({required PostRepository postsRepository})
      : _postsRepository = postsRepository,
        super(PostsInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  final PostRepository _postsRepository;

  Future<void> _onFetchPosts(
    FetchPosts event,
    Emitter<PostState> emit,
  ) async {
    try {
      emit(PostsLoading());

      final hasConnected = await InternetConnectionChecker.instance.hasConnection;

      if (hasConnected) {
        final serverResponse = await _postsRepository.getPosts();
        await _postsRepository.savePostsLocal(posts: serverResponse);
        final localPosts = await _postsRepository.getPosts();
        emit(PostsLoaded(response: localPosts));
      } else {
        final localPosts = await _postsRepository.getPostsLocal();
        emit(PostsLoaded(response: localPosts));
      }
    } catch (e) {
      emit(PostsError(error: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:linkedin_post_generator/form/model/post.dart';

class FormCubit extends Cubit<Post> {
  FormCubit() : super(Post.empty);

  void setName(String name) => emit(
        state.copyWith(name: name),
      );
  void setJobDescription(String jobDescription) => emit(
        state.copyWith(jobDescription: jobDescription),
      );

  void setEmail(String email) => emit(
        state.copyWith(email: email),
      );
  void setMessage(String message) => emit(
        state.copyWith(message: message),
      );
}

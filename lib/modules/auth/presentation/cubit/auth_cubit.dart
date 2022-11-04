import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:promina_task/core/error/exception.dart';
import 'package:promina_task/modules/auth/domain/entities/user_entity.dart';

import '../../domain/usecases/login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(this.loginUsecase) : super(AuthInitial());
  LoginUsecase loginUsecase;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  late UserEntity user;



  Future<void> login(String email,String password)async {
    emit(AuthLoading());
    print("loading");

    Either<Failure,UserEntity> loginResponse = await loginUsecase(email,password);
    loginResponse.fold(
            (l) {
              emit(AuthFailure(failure: l));
              print(l.message);
            },
            (r) {
              emit(AuthSuccess(user: r));
              print(r.name);
            });


  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eshot_clone/services/eshot_api/eshot_api.dart';

enum AuthStatusState { unauthenticated, authenticated, fail }

class AuthCubit extends Cubit<AuthStatusState> {
  AuthCubit(this._eshotApi) : super(AuthStatusState.unauthenticated);
  final EshotApi _eshotApi;
  void getToken() async {
    emit(AuthStatusState.unauthenticated);
    try {
      final token = await _eshotApi.getToken();
      await _eshotApi.setToken(token);
      emit(AuthStatusState.authenticated);
    } catch (e) {
       emit(AuthStatusState.fail);
    }
  }
}

import '../../data/data_sources/remote/login_remote_data_source.dart';
import '../../models/user_model.dart';

class AuthRepository {
  final LoginRemoteDataSource remote;

  AuthRepository({required this.remote});

  Future<User> login(String username, String password) async {
    final data = await remote.login(username, password);
    return User.fromJson(data);
  }
}

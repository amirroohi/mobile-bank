import '../../core/services/account_service.dart';
import '../../models/account_model.dart';


class AccountRepository {
  final AccountService service;

  AccountRepository(this.service);

  Future<List<Account>> getAllAccounts() {
    return service.fetchAccounts();
  }
}

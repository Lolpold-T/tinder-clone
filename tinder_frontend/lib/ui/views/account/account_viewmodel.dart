import 'package:stacked/stacked.dart';
import 'package:tinder_clone/models/user_model.dart';
import 'package:tinder_clone/services/tinder_services.dart';

class AccountViewModel extends BaseViewModel {
  UserModel user = UserModel(
      age: 'failed',
      img: 'assets/images/profile.png',
      likes: '',
      name: 'failed');
  TinderServices _tinderServices = TinderServices();

  Future<UserModel> getUser() async {
    List<UserModel> users = await _tinderServices.fetchAllUsers() ?? [];
    if (users.isEmpty) return user;
    user = users[0];
    return users[0];
  }
}

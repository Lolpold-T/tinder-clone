import 'package:stacked/stacked.dart';
import 'package:tinder_clone/models/user_model.dart';
import 'package:tinder_clone/services/tinder_services.dart';

class LikesViewModel extends BaseViewModel {
  List<UserModel> likedLeos = [];
  TinderServices _tinderServices = TinderServices();
  Future<List<UserModel>> getLikedLeos() async {
    likedLeos = await _tinderServices.fetchAllLeos() ?? [];
    notifyListeners();
    return likedLeos;
  }
}

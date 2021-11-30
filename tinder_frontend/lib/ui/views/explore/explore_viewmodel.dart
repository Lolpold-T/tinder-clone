import 'package:stacked/stacked.dart';
import 'package:tinder_clone/models/user_model.dart';
import 'package:tinder_clone/services/tinder_services.dart';

class ExploreViewModel extends BaseViewModel {
  List<UserModel> leos = [];

  List<UserModel> likedLeos = [];
  TinderServices _tinderServices = TinderServices();

  Future<List<UserModel>> getLeos() async {
    leos = await _tinderServices.fetchAllLeos() ?? [];
    notifyListeners();
    return leos;
  }

  void shuffleCards() {
    leos.shuffle();
    notifyListeners();
  }

  void addLikedLeo(int index) {
    likedLeos.add(leos[index]);
  }

  List<String> likes(index) {
    return leos[index].likes!.split('#');
  }
}

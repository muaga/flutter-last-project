import 'package:flutter_blog/data/dto/response_dto/reponse_dto.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/data/store/session_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class MySettingProfileModel {
  final int id;
  final String picUrl;
  final String nickname;
  final String email;

  MySettingProfileModel(
      {required this.id,
      required this.picUrl,
      required this.nickname,
      required this.email});

  MySettingProfileModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        picUrl = json["picUrl"],
        nickname = json["nickname"],
        email = json["email"];
}

class MySettingProfileViewModel extends StateNotifier<MySettingProfileModel?> {
  Ref ref;
  MySettingProfileViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionStore);
    ResponseDTO responseDTO =
        await UserRepository().fetchUserInfo(sessionUser.jwt!);
    MySettingProfileModel model = responseDTO.data;
    state = MySettingProfileModel(
        id: model.id,
        picUrl: model.picUrl,
        nickname: model.nickname,
        email: model.email);
    Logger().d("상태 : ${state?.nickname}");
  }
}

final mySettingProfileProvider = StateNotifierProvider.autoDispose<
    MySettingProfileViewModel, MySettingProfileModel?>((ref) {
  return MySettingProfileViewModel(null, ref)..notifyInit();
});

import 'dart:convert';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../constants/local_string.dart';
import '../model/extracted_token.dart';

class UserController extends GetxController {
  Box<UserInfo> userBox = Hive.box<UserInfo>(LocalString.USER_BOX);
  // Box<Token> tokenBox = Hive.box<Token>(LocalString.TOKEN_BOX);
  UserInfo? get getUserInfo => userBox.get('userInfo');
  
  updateUserInfo({file}){
    var body = jsonEncode({
      // "active": true,
      // "address": addressController.text,
      // "areaId": areaIdController.text,
      // "displayName": displayNameController.text,
      // "email": emailController.text,
      // "holdingId": holdingIdController.text,
      // "id": getUserInfo.value.data!.id.toString(),
      // "mobile": getUserInfo.value.data!.mobile,
      // "nidOrBcNo": nidController.text,
      // "passwordPolicyId": 2,
      // "roadId": roadIdController.text,
      // "userTypeId": 2,
      // "userTypeName": "User",
      // "username": getUserInfo.value.data!.username,
      // "wordId": wardIdController.text,
      // "zoneId": zoneIdController.text,
      // "profileLocation": getUserInfo.value.data?.profileLocation,
      // "profileName": getUserInfo.value.data?.profileName,
    });
    // ApiRequest request = ApiRequest(url: ApiPath.urlUserUpdate,body: body);
    // request.putRequest(isLoadingDialog: true).then((res) {
    //   Get.back();
    //  file != null? _updateProfileImage(file:file):  getUser(id:getUserInfo.value.data!.id.toString(),);
    // }).catchError((e){
    //   print(e);
    // });
  }

  _updateProfileImage({file})async{
    // Token? token = tokenBox.get('token');
    // var uri = Uri.parse(ApiPath.baseUrl + ApiPath.urlUserPicUpdate);
    // var body = jsonEncode({
    //   "active": true,
    //   "address": addressController.text,
    //   "areaId": areaIdController.text,
    //   "displayName": displayNameController.text,
    //   "email": emailController.text,
    //   "holdingId": holdingIdController.text,
    //   "id": getUserInfo.value.data!.id.toString(),
    //   "mobile": getUserInfo.value.data!.mobile,
    //   "nidOrBcNo": nidController.text,
    //   "passwordPolicyId": 2,
    //   "roadId": roadIdController.text,
    //   "userTypeId": 2,
    //   "userTypeName": "User",
    //   "username": getUserInfo.value.data!.username,
    //   "wordId": wardIdController.text,
    //   "zoneId": zoneIdController.text,
    // });
    //
    // var request = http.MultipartRequest(
    //   'PUT',
    //   uri,
    // );
    // request.headers.addAll({
    //   'Authorization': 'Bearer ${token!.data!.token}',
    // });
    //
    // request.files.add(http.MultipartFile.fromString('body', body,
    //     contentType: MediaType('application', 'json')));
    //
    // file != null
    // ? request.files.add(await http.MultipartFile.fromPath(
    // 'profile', file.path,
    // contentType: MediaType('image', 'jpeg')))
    //     : null;
    //
    // var response = await request.send();
    // if (response.statusCode == 200) {
    //   response.stream
    //       .transform(const Utf8Decoder())
    //       .transform(const LineSplitter())
    //       .listen(
    //         (value) async { },
    //     onError: (e, sT) {
    //       print(e);
    //     },
    //     onDone: () {
    //       getUser(id:getUserInfo.value.data!.id.toString(),);
    //       print('done');
    //     },
    //   );
    // }else{
    //   print(LocalString.Opss_Something_wrong_happened.tr);
    // }
  }

  // getUser({id}) {
    // ApiRequest request = ApiRequest(url: ApiPath.urlUserInfo + id.toString());
    // request.getRequestWithAuth().then((res) {
    //   if (res!.statusCode == 200) {
    //     UserInfo userInfo = UserInfo.fromJson(jsonDecode(res.body));
    //     userBox.put('userInfo', userInfo);
    //     onInit();
    //   } else {
    //     Get.back();
    //     Fluttertoast.showToast(msg: res.reasonPhrase.toString());
    //   }
    // }).catchError((e) {
    //   Get.back();
    //   print(e);
    // });
  // }
}

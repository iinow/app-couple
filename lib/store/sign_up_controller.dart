import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class SignUpController extends GetxController {
  var nickName = ''.obs;
  var checkAll = false.obs;
  var checkAge = false.obs;
  var checkTermsAndConditions = false.obs;
  var checkCollectPersonalInformation = false.obs;
  var checkMarketingUtilization = false.obs;
  var checkNickName = false.obs;

  void handleCheckAll() {
    this.checkAge = true.obs;
    this.checkTermsAndConditions = true.obs;
    this.checkCollectPersonalInformation = true.obs;
    this.checkMarketingUtilization = true.obs;
  }

  void handleCheckNickName(bool result) {
    this.checkNickName = result.obs;
  }

  void handleNickName(String nickName) {
    this.nickName = nickName.obs;
  }
}

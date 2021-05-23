import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class SignUpController extends GetxController {
  var nickName = ''.obs;
  var checkAge = false.obs;
  var checkTermsAndConditions = false.obs;
  var checkCollectPersonalInformation = false.obs;
  var checkMarketingUtilization = false.obs;
  var checkNickName = false.obs;
  var imagePath = ''.obs;

  void handleCheckAll() {
    if (checkAll().isTrue) {
      this.checkAge(false);
      this.checkTermsAndConditions(false);
      this.checkCollectPersonalInformation(false);
      this.checkMarketingUtilization(false);
      return;
    }
    this.checkAge(true);
    this.checkTermsAndConditions(true);
    this.checkCollectPersonalInformation(true);
    this.checkMarketingUtilization(true);
  }

  void handleCheckNickName(bool result) {
    this.checkNickName(result);
  }

  void handleNickName(String nickName) {
    this.nickName(nickName);
    this.checkNickName(false);
  }

  RxBool checkAll() {
    var all = this.checkAge.isTrue &&
        this.checkTermsAndConditions.isTrue &&
        this.checkCollectPersonalInformation.isTrue &&
        this.checkMarketingUtilization.isTrue;
    return all.obs;
  }

  RxBool isRequiredCheck() {
    var requiredValue = this.checkNickName.isTrue &&
        this.checkAge.isTrue &&
        this.checkTermsAndConditions.isTrue &&
        this.checkCollectPersonalInformation.isTrue;
    return requiredValue.obs;
  }

  @override
  String toString() {
    return 'checkAge: ${this.checkAge}, ' +
        'checkTermsAndConditions: ${this.checkTermsAndConditions}, ' +
        'checkCollectPersonalInformation: ${this.checkCollectPersonalInformation}, ' +
        'checkMarketingUtilization: ${this.checkMarketingUtilization}';
  }
}

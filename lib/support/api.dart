import 'dart:io';
import 'dart:typed_data';

import 'package:artemis/artemis.dart';
import 'package:doing_app/common/constants/environment_config.dart';
import 'package:doing_app/graphql/generated/doing.query.graphql.dart';
import 'package:http/http.dart' as http;

class Api {
  Api._privateConstructor();

  static final Api _client = Api._privateConstructor();

  static final HttpClient client = HttpClient();

  static final ArtemisClient graphqlClient =
      ArtemisClient(EnvironmentConfig.graphqlUrl);

  callGet() async {
    var res = await http.Client().get('https://yesno.wtf/api');

    print(res.body);
  }

  Future<String> uploadFile(String imagePath) async {
    var resOtp = await Api.graphqlClient.execute(GetOtpQuery());

    var request = http.MultipartRequest(
        'POST', Uri.parse('${EnvironmentConfig.url}/file/upload'));
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', imagePath);

    request.files.add(multipartFile);
    request.headers['X-Otp'] = resOtp.data.otp.value;

    var res = await request.send();
    var resString = await res.stream.bytesToString();
    return resString;
  }

  factory Api() {
    return _client;
  }
}

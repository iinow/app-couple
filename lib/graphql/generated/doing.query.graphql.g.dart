// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doing.query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMe$Query$Me _$GetMe$Query$MeFromJson(Map<String, dynamic> json) {
  return GetMe$Query$Me()
    ..uuid = json['uuid'] as String
    ..nickName = json['nickName'] as String;
}

Map<String, dynamic> _$GetMe$Query$MeToJson(GetMe$Query$Me instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'nickName': instance.nickName,
    };

GetMe$Query _$GetMe$QueryFromJson(Map<String, dynamic> json) {
  return GetMe$Query()
    ..me = json['me'] == null
        ? null
        : GetMe$Query$Me.fromJson(json['me'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetMe$QueryToJson(GetMe$Query instance) =>
    <String, dynamic>{
      'me': instance.me?.toJson(),
    };

SignIn$Mutation$SignInOutput _$SignIn$Mutation$SignInOutputFromJson(
    Map<String, dynamic> json) {
  return SignIn$Mutation$SignInOutput()
    ..accessToken = json['accessToken'] as String;
}

Map<String, dynamic> _$SignIn$Mutation$SignInOutputToJson(
        SignIn$Mutation$SignInOutput instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
    };

SignIn$Mutation _$SignIn$MutationFromJson(Map<String, dynamic> json) {
  return SignIn$Mutation()
    ..signIn = json['signIn'] == null
        ? null
        : SignIn$Mutation$SignInOutput.fromJson(
            json['signIn'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SignIn$MutationToJson(SignIn$Mutation instance) =>
    <String, dynamic>{
      'signIn': instance.signIn?.toJson(),
    };

SignInDeviceInput _$SignInDeviceInputFromJson(Map<String, dynamic> json) {
  return SignInDeviceInput(
    os: _$enumDecodeNullable(_$OsEnumMap, json['os'],
        unknownValue: Os.artemisUnknown),
    model: json['model'] as String,
    version: json['version'] as String,
  );
}

Map<String, dynamic> _$SignInDeviceInputToJson(SignInDeviceInput instance) =>
    <String, dynamic>{
      'os': _$OsEnumMap[instance.os],
      'model': instance.model,
      'version': instance.version,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$OsEnumMap = {
  Os.ios: 'IOS',
  Os.android: 'ANDROID',
  Os.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

SignInInput _$SignInInputFromJson(Map<String, dynamic> json) {
  return SignInInput(
    email: json['email'] as String,
    provider: _$enumDecodeNullable(_$ProviderEnumMap, json['provider'],
        unknownValue: Provider.artemisUnknown),
    device: json['device'] == null
        ? null
        : SignInDeviceInput.fromJson(json['device'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SignInInputToJson(SignInInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'provider': _$ProviderEnumMap[instance.provider],
      'device': instance.device?.toJson(),
    };

const _$ProviderEnumMap = {
  Provider.google: 'GOOGLE',
  Provider.kakao: 'KAKAO',
  Provider.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

SignUp$Mutation$Me _$SignUp$Mutation$MeFromJson(Map<String, dynamic> json) {
  return SignUp$Mutation$Me()
    ..uuid = json['uuid'] as String
    ..nickName = json['nickName'] as String;
}

Map<String, dynamic> _$SignUp$Mutation$MeToJson(SignUp$Mutation$Me instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'nickName': instance.nickName,
    };

SignUp$Mutation _$SignUp$MutationFromJson(Map<String, dynamic> json) {
  return SignUp$Mutation()
    ..signUp = json['signUp'] == null
        ? null
        : SignUp$Mutation$Me.fromJson(json['signUp'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SignUp$MutationToJson(SignUp$Mutation instance) =>
    <String, dynamic>{
      'signUp': instance.signUp?.toJson(),
    };

SignUpInput _$SignUpInputFromJson(Map<String, dynamic> json) {
  return SignUpInput(
    email: json['email'] as String,
    provider: _$enumDecodeNullable(_$ProviderEnumMap, json['provider'],
        unknownValue: Provider.artemisUnknown),
    name: json['name'] as String,
    nickName: json['nickName'] as String,
    profileImageUrl: json['profileImageUrl'] as String,
  );
}

Map<String, dynamic> _$SignUpInputToJson(SignUpInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'provider': _$ProviderEnumMap[instance.provider],
      'name': instance.name,
      'nickName': instance.nickName,
      'profileImageUrl': instance.profileImageUrl,
    };

ExistNickName$Query$ExistNickNameOutput
    _$ExistNickName$Query$ExistNickNameOutputFromJson(
        Map<String, dynamic> json) {
  return ExistNickName$Query$ExistNickNameOutput()
    ..exist = json['exist'] as bool;
}

Map<String, dynamic> _$ExistNickName$Query$ExistNickNameOutputToJson(
        ExistNickName$Query$ExistNickNameOutput instance) =>
    <String, dynamic>{
      'exist': instance.exist,
    };

ExistNickName$Query _$ExistNickName$QueryFromJson(Map<String, dynamic> json) {
  return ExistNickName$Query()
    ..existNickName = json['existNickName'] == null
        ? null
        : ExistNickName$Query$ExistNickNameOutput.fromJson(
            json['existNickName'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ExistNickName$QueryToJson(
        ExistNickName$Query instance) =>
    <String, dynamic>{
      'existNickName': instance.existNickName?.toJson(),
    };

ExistNickNameInput _$ExistNickNameInputFromJson(Map<String, dynamic> json) {
  return ExistNickNameInput(
    nickName: json['nickName'] as String,
  );
}

Map<String, dynamic> _$ExistNickNameInputToJson(ExistNickNameInput instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
    };

SignInArguments _$SignInArgumentsFromJson(Map<String, dynamic> json) {
  return SignInArguments(
    signInInput: json['signInInput'] == null
        ? null
        : SignInInput.fromJson(json['signInInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SignInArgumentsToJson(SignInArguments instance) =>
    <String, dynamic>{
      'signInInput': instance.signInInput?.toJson(),
    };

SignUpArguments _$SignUpArgumentsFromJson(Map<String, dynamic> json) {
  return SignUpArguments(
    signUpInput: json['signUpInput'] == null
        ? null
        : SignUpInput.fromJson(json['signUpInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SignUpArgumentsToJson(SignUpArguments instance) =>
    <String, dynamic>{
      'signUpInput': instance.signUpInput?.toJson(),
    };

ExistNickNameArguments _$ExistNickNameArgumentsFromJson(
    Map<String, dynamic> json) {
  return ExistNickNameArguments(
    existNickNameInput: json['existNickNameInput'] == null
        ? null
        : ExistNickNameInput.fromJson(
            json['existNickNameInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExistNickNameArgumentsToJson(
        ExistNickNameArguments instance) =>
    <String, dynamic>{
      'existNickNameInput': instance.existNickNameInput?.toJson(),
    };

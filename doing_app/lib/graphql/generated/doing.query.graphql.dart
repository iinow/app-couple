// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'doing.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMe$Query$Me with EquatableMixin {
  GetMe$Query$Me();

  factory GetMe$Query$Me.fromJson(Map<String, dynamic> json) =>
      _$GetMe$Query$MeFromJson(json);

  String uuid;

  String nickName;

  @override
  List<Object> get props => [uuid, nickName];
  Map<String, dynamic> toJson() => _$GetMe$Query$MeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMe$Query with EquatableMixin {
  GetMe$Query();

  factory GetMe$Query.fromJson(Map<String, dynamic> json) =>
      _$GetMe$QueryFromJson(json);

  GetMe$Query$Me me;

  @override
  List<Object> get props => [me];
  Map<String, dynamic> toJson() => _$GetMe$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation$SignInOutput with EquatableMixin {
  SignIn$Mutation$SignInOutput();

  factory SignIn$Mutation$SignInOutput.fromJson(Map<String, dynamic> json) =>
      _$SignIn$Mutation$SignInOutputFromJson(json);

  String accessToken;

  @override
  List<Object> get props => [accessToken];
  Map<String, dynamic> toJson() => _$SignIn$Mutation$SignInOutputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation with EquatableMixin {
  SignIn$Mutation();

  factory SignIn$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SignIn$MutationFromJson(json);

  SignIn$Mutation$SignInOutput signIn;

  @override
  List<Object> get props => [signIn];
  Map<String, dynamic> toJson() => _$SignIn$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignInInput with EquatableMixin {
  SignInInput({@required this.email, @required this.provider});

  factory SignInInput.fromJson(Map<String, dynamic> json) =>
      _$SignInInputFromJson(json);

  String email;

  @JsonKey(unknownEnumValue: Provider.artemisUnknown)
  Provider provider;

  @override
  List<Object> get props => [email, provider];
  Map<String, dynamic> toJson() => _$SignInInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUp$Mutation$Me with EquatableMixin {
  SignUp$Mutation$Me();

  factory SignUp$Mutation$Me.fromJson(Map<String, dynamic> json) =>
      _$SignUp$Mutation$MeFromJson(json);

  String uuid;

  String nickName;

  @override
  List<Object> get props => [uuid, nickName];
  Map<String, dynamic> toJson() => _$SignUp$Mutation$MeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUp$Mutation with EquatableMixin {
  SignUp$Mutation();

  factory SignUp$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SignUp$MutationFromJson(json);

  SignUp$Mutation$Me signUp;

  @override
  List<Object> get props => [signUp];
  Map<String, dynamic> toJson() => _$SignUp$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUpDeviceInput with EquatableMixin {
  SignUpDeviceInput(
      {@required this.os, @required this.model, @required this.version});

  factory SignUpDeviceInput.fromJson(Map<String, dynamic> json) =>
      _$SignUpDeviceInputFromJson(json);

  @JsonKey(unknownEnumValue: Os.artemisUnknown)
  Os os;

  String model;

  String version;

  @override
  List<Object> get props => [os, model, version];
  Map<String, dynamic> toJson() => _$SignUpDeviceInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUpInput with EquatableMixin {
  SignUpInput(
      {@required this.email,
      @required this.provider,
      @required this.name,
      @required this.nickName,
      @required this.photoUrl,
      @required this.device});

  factory SignUpInput.fromJson(Map<String, dynamic> json) =>
      _$SignUpInputFromJson(json);

  String email;

  @JsonKey(unknownEnumValue: Provider.artemisUnknown)
  Provider provider;

  String name;

  String nickName;

  String photoUrl;

  SignUpDeviceInput device;

  @override
  List<Object> get props => [email, provider, name, nickName, photoUrl, device];
  Map<String, dynamic> toJson() => _$SignUpInputToJson(this);
}

enum Provider {
  @JsonValue('GOOGLE')
  google,
  @JsonValue('KAKAO')
  kakao,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum Os {
  @JsonValue('IOS')
  ios,
  @JsonValue('ANDROID')
  android,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

class GetMeQuery extends GraphQLQuery<GetMe$Query, JsonSerializable> {
  GetMeQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetMe'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'me'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'uuid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'nickName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GetMe';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetMe$Query parse(Map<String, dynamic> json) => GetMe$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignInArguments extends JsonSerializable with EquatableMixin {
  SignInArguments({@required this.signInInput});

  @override
  factory SignInArguments.fromJson(Map<String, dynamic> json) =>
      _$SignInArgumentsFromJson(json);

  final SignInInput signInInput;

  @override
  List<Object> get props => [signInInput];
  @override
  Map<String, dynamic> toJson() => _$SignInArgumentsToJson(this);
}

class SignInMutation extends GraphQLQuery<SignIn$Mutation, SignInArguments> {
  SignInMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'SignIn'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'signInInput')),
              type: NamedTypeNode(
                  name: NameNode(value: 'SignInInput'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'signIn'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'signInInput'),
                    value: VariableNode(name: NameNode(value: 'signInInput')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'accessToken'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'SignIn';

  @override
  final SignInArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SignIn$Mutation parse(Map<String, dynamic> json) =>
      SignIn$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignUpArguments extends JsonSerializable with EquatableMixin {
  SignUpArguments({@required this.signUpInput});

  @override
  factory SignUpArguments.fromJson(Map<String, dynamic> json) =>
      _$SignUpArgumentsFromJson(json);

  final SignUpInput signUpInput;

  @override
  List<Object> get props => [signUpInput];
  @override
  Map<String, dynamic> toJson() => _$SignUpArgumentsToJson(this);
}

class SignUpMutation extends GraphQLQuery<SignUp$Mutation, SignUpArguments> {
  SignUpMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'SignUp'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'signUpInput')),
              type: NamedTypeNode(
                  name: NameNode(value: 'SignUpInput'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'signUp'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'signUpInput'),
                    value: VariableNode(name: NameNode(value: 'signUpInput')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'uuid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'nickName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'SignUp';

  @override
  final SignUpArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SignUp$Mutation parse(Map<String, dynamic> json) =>
      SignUp$Mutation.fromJson(json);
}

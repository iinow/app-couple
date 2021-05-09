# doing_app

[![Dart](https://github.com/dOingCouple/Flutter/actions/workflows/dart.yml/badge.svg?branch=develop)](https://github.com/dOingCouple/Flutter/actions/workflows/dart.yml)

## Graphql Code generate

```shell script
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## Environment File generate

```shell script
## 환경 변수 기본 생성
fvm flutter pub run environment_config:generate

## 환경 변수 약어(a) 를 오버라이딩 할 경우
fvm flutter pub run environment_config:generate -a https://localhost:3000
```
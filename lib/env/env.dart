// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: 'ACCESS_TOKEN') // the .env variable.
  static const String accessToken = _Env.accessToken;
}

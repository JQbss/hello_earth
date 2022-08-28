import 'package:hello_earth/commons/json/from_json_factories.dart';

class BaseResponse<T> {
  final T data;

  const BaseResponse._fromJson({
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    try {
      return BaseResponse._fromJson(
        data: fromJsonFactories[T]?.call(json) as T,
      );
    } catch (_) {
      throw UnimplementedError();
    }
  }
}

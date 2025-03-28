import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

enum AsyncValueState { loading, error, success }

class AsyncValue<T> {
  final T? value;
  final Object? exception;
  final AsyncValueState status;

  AsyncValue._({this.value, this.exception, required this.status});

  factory AsyncValue.loading() => AsyncValue._(status: AsyncValueState.loading);

  factory AsyncValue.success(T value) =>
      AsyncValue._(value: value, status: AsyncValueState.success);

  factory AsyncValue.error(Object exception) =>
      AsyncValue._(exception: exception, status: AsyncValueState.error);

  Widget map({
    required Center Function(dynamic _) loading,
    required Center Function(dynamic _) error,
    required Stack Function(dynamic data) data,
  }) {
    switch (status) {
      case AsyncValueState.loading:
        return loading(null);
      case AsyncValueState.error:
        return error(exception);
      case AsyncValueState.success:
        return data(value);
    }
  }
}

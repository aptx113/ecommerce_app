// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppException _$AppExceptionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'permissionDenied':
      return PermissionDenied.fromJson(json);
    case 'paymentfailed':
      return PaymentFailed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AppException',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() paymentfailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? paymentfailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? paymentfailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(PaymentFailed value) paymentfailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(PaymentFailed value)? paymentfailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(PaymentFailed value)? paymentfailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res> implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  final AppException _value;
  // ignore: unused_field
  final $Res Function(AppException) _then;
}

/// @nodoc
abstract class _$$PermissionDeniedCopyWith<$Res> {
  factory _$$PermissionDeniedCopyWith(
          _$PermissionDenied value, $Res Function(_$PermissionDenied) then) =
      __$$PermissionDeniedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PermissionDeniedCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$PermissionDeniedCopyWith<$Res> {
  __$$PermissionDeniedCopyWithImpl(
      _$PermissionDenied _value, $Res Function(_$PermissionDenied) _then)
      : super(_value, (v) => _then(v as _$PermissionDenied));

  @override
  _$PermissionDenied get _value => super._value as _$PermissionDenied;
}

/// @nodoc
@JsonSerializable()
class _$PermissionDenied implements PermissionDenied {
  const _$PermissionDenied({final String? $type})
      : $type = $type ?? 'permissionDenied';

  factory _$PermissionDenied.fromJson(Map<String, dynamic> json) =>
      _$$PermissionDeniedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppException.permissionDenied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PermissionDenied);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() paymentfailed,
  }) {
    return permissionDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? paymentfailed,
  }) {
    return permissionDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? paymentfailed,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(PaymentFailed value) paymentfailed,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(PaymentFailed value)? paymentfailed,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(PaymentFailed value)? paymentfailed,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionDeniedToJson(
      this,
    );
  }
}

abstract class PermissionDenied implements AppException {
  const factory PermissionDenied() = _$PermissionDenied;

  factory PermissionDenied.fromJson(Map<String, dynamic> json) =
      _$PermissionDenied.fromJson;
}

/// @nodoc
abstract class _$$PaymentFailedCopyWith<$Res> {
  factory _$$PaymentFailedCopyWith(
          _$PaymentFailed value, $Res Function(_$PaymentFailed) then) =
      __$$PaymentFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentFailedCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$PaymentFailedCopyWith<$Res> {
  __$$PaymentFailedCopyWithImpl(
      _$PaymentFailed _value, $Res Function(_$PaymentFailed) _then)
      : super(_value, (v) => _then(v as _$PaymentFailed));

  @override
  _$PaymentFailed get _value => super._value as _$PaymentFailed;
}

/// @nodoc
@JsonSerializable()
class _$PaymentFailed implements PaymentFailed {
  const _$PaymentFailed({final String? $type})
      : $type = $type ?? 'paymentfailed';

  factory _$PaymentFailed.fromJson(Map<String, dynamic> json) =>
      _$$PaymentFailedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AppException.paymentfailed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentFailed);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionDenied,
    required TResult Function() paymentfailed,
  }) {
    return paymentfailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? paymentfailed,
  }) {
    return paymentfailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionDenied,
    TResult Function()? paymentfailed,
    required TResult orElse(),
  }) {
    if (paymentfailed != null) {
      return paymentfailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionDenied value) permissionDenied,
    required TResult Function(PaymentFailed value) paymentfailed,
  }) {
    return paymentfailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(PaymentFailed value)? paymentfailed,
  }) {
    return paymentfailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionDenied value)? permissionDenied,
    TResult Function(PaymentFailed value)? paymentfailed,
    required TResult orElse(),
  }) {
    if (paymentfailed != null) {
      return paymentfailed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentFailedToJson(
      this,
    );
  }
}

abstract class PaymentFailed implements AppException {
  const factory PaymentFailed() = _$PaymentFailed;

  factory PaymentFailed.fromJson(Map<String, dynamic> json) =
      _$PaymentFailed.fromJson;
}

import '../error_imports.dart';

class RemoteFailure {
  final String message;

  RemoteFailure._({required this.message});

  factory RemoteFailure(ServerException error) {
    return RemoteFailure._(message: error.message);
  }

  @override
  bool operator ==(covariant RemoteFailure other) {
    if (identical(this, other)) return true;
    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'RemoteFailure(errorMsg: $message)';
}

class Failure {
  final String msg;
  final int status;

  Failure({required this.msg, required this.status});
}

class Success<T> {
  final T data;
  Success(this.data);
}

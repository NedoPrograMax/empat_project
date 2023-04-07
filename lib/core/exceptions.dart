class MyException {
  final String message;
  const MyException(this.message);
}

class ApiException extends MyException {
  const ApiException(super.message);
}

class PermissionException extends MyException {
  const PermissionException(super.message);
}

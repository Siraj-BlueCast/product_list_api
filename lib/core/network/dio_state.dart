abstract class DioState {

}

class DioSuccess extends DioState {
  dynamic data;
  DioSuccess(this.data);
}

class DioFailed extends DioState {
  final String error;
  DioFailed(this.error);
}
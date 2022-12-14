class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.initial(this.message) : status = Status.Initial;
  ApiResponse.complated(this.data) : status = Status.Complated;
  ApiResponse.error(this.message) : status = Status.Error;
  ApiResponse.loading(this.message) : status = Status.Loading;
}

enum Status { Initial, Complated, Error, Loading }

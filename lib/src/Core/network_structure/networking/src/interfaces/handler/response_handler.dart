abstract class ResponseHandler<R,E> {
  R? handleResponse({R? response,E? error});
}
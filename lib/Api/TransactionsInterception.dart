import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class TransactionInterceptor implements InterceptorContract {
  //client que vai ser usado para fazer as requests
  final Client client =
      InterceptedClient.build(interceptors: [TransactionInterceptor()]);

  //serve para interceptar as REQUESTS ou seja receber os codigo HTTP
  //como 200, 500, 400 etc...
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data);
    return data;
  }

  //serve para interceptar as RESPONSES ou seja receber os codigo HTTP
  //como 200, 500, 400 etc...
  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data);
    return data;
  }
}

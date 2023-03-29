import 'package:dio/dio.dart';
import 'package:vikings_bank/network/app_network_services.dart';
import 'package:vikings_bank/utils/exceptions.dart';


class BankUserNetworkClient {
  Dio? _dio;

  BankUserNetworkClient._();

  static final BankUserNetworkClient instance = BankUserNetworkClient._();

  Future<Dio> get __dio async {
    if(_dio != null) return _dio!;

    _dio = Dio(BaseOptions(baseUrl: AppNetworkServices.networkClientService));
    return _dio!;    
  }

  Future<List<dynamic>> getBankUserDetails(String firstName, String panId, String phone) async {
    try {
      Dio http = await __dio;

      Response response = await http.get('/user_details/$firstName/$panId/$phone');
  
      if(response.statusCode == 200) {
        return response.data;
      }

      throw NetworkException('Something Went Wrong');

    } catch(_) {
      throw NetworkException('Something Went Wrong');
    }
  }


}
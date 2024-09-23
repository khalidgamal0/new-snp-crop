import '../services/api_service.dart';

// Usage Example
// var registerModel = await postDataImpl.post(
//   apiName: 'your_api_name',
//   body: yourRequestBody,
//   parser: (json) => RegisterModel.fromJson(json),
// );
//------------------------------------------
final BaseRepo baseController = BaseRepoImpl();
//------------------------------------------

typedef JsonParser<T> = T Function(Map<String, dynamic> json);

abstract class BaseRepo<T> {
  Future<T?> call(
      {required String apiName,
      required Map<String, dynamic> body,
      required JsonParser<T> parser,
      required ActionType actionType});
}

class BaseRepoImpl<T> implements BaseRepo<T> {
  @override
  Future<T?> call(
      {required String apiName,
      required Map<String, dynamic> body,
      required JsonParser<T> parser,
      required ActionType actionType}) async {
    T? model;
    var result = await ApiService.callService(
        actionType: actionType, apiName: apiName, body: body);
    result.fold((failure) => print(failure.msg + failure.status.toString()),
        (success) {
      model = parser(success.data);
    });
    return model;
  }
}

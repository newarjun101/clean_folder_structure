import 'package:hive_innovation_shop/app/core/vos/api_handling_vo/api_status.dart';

class ApiResult<T> {
  ApiStatus status;
  String errorMessage;
  T mData;

  ApiResult(this.status, this.errorMessage, this.mData);
}

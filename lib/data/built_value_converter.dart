import 'package:chooper/model/built_post.dart';
import 'package:chooper/model/serializer.dart';
import 'package:chopper/chopper.dart';

class BuiltValueConverter extends JsonConverter{

  @override
  Request convertRequest(Request request) {
    return super.convertRequest(
        request.replace(
      body: serializers.serializeWith(
        serializers.serializerForType(request.body.runtimeType),
        request.body,
      ),
    ),
    );
  }

  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(
      Response response,
      ){
    final Response dynamicResponse = super.convertResponse(response);
    final BodyType customBody =
  }
  dynamic _convertToCustomObject<SingleItemType>(dynamic element){
    if(element is SingleItemType){
      return element;
    }
    if(element is List){
      return _diserializeListOf<SingleItemType>(element);
    }else{
      return _diserialize<SingleItemType>(element);
    }
  }
}
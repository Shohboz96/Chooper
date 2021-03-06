import 'package:chooper/model/built_post.dart';
import 'package:chopper/chopper.dart';

import 'mobile_data_interceptor.dart';
import 'package:built_collection/built_collection.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<BuiltPost>> getPost(@Path('id') int id);

  @Post()
  Future<Response<BuiltPost>> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        // HeadersInterceptor({'Cache-Control': 'no-cache'}),
        // HttpLoggingInterceptor(),
        // CurlInterceptor(),
        // MobileDataInterceptor(),

        // (Request request) async {
        //   if (request.method == HttpMethod.Post) {
        //     chopperLogger.info('Performed a post request');
        //   }
        //   return request;
        // },
        //
        // (Response response) async {
        //   if (response.statusCode == 404) {
        //     chopperLogger.severe('404 not found');
        //   }
        //   return response;
        // },
      ],
      converter: BuiltValueConverter(),
    );
    return _$PostApiService(client);
  }
}

import 'package:book_your_book/core/utils/api_service.dart';
import 'package:book_your_book/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


  final getIt = GetIt.instance;
  void setupServiceLocator() {
    getIt.registerSingleton<ApiService>( ApiService(
      Dio(),
    ));
    getIt.registerSingleton<HomeRepoImpl>(
        HomeRepoImpl(
          getIt.get<ApiService>()
        ),
    );
  }


import 'package:bootx_app/core/services/network/api_dio_config.dart';
import 'package:bootx_app/core/services/network/api_service.dart';
import 'package:bootx_app/core/services/network/api_service_impl.dart';
import 'package:bootx_app/features/auth/data/date_sourse/sign_in_remote_data_source.dart';
import 'package:bootx_app/features/auth/data/date_sourse/sign_in_remote_data_source_impl.dart';
import 'package:bootx_app/features/auth/data/date_sourse/sign_up_remote_data_source.dart';
import 'package:bootx_app/features/auth/data/date_sourse/sign_up_remote_data_source_impl.dart';
import 'package:bootx_app/features/auth/data/repo/sign_in_repository_impl.dart';
import 'package:bootx_app/features/auth/data/repo/sign_up_repository_impl.dart';
import 'package:bootx_app/features/auth/domain/repo/sign_in_repository.dart';
import 'package:bootx_app/features/auth/domain/repo/sign_up_repository.dart';
import 'package:bootx_app/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:bootx_app/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:bootx_app/features/home/data/data_source/category_remote_data_source.dart';
import 'package:bootx_app/features/home/data/data_source/category_remote_data_source_impl.dart';
import 'package:bootx_app/features/home/data/data_source/product_remote_data_source.dart';
import 'package:bootx_app/features/home/data/data_source/product_remote_data_source_impl.dart';
import 'package:bootx_app/features/home/data/repo/category_repository_impl.dart';
import 'package:bootx_app/features/home/data/repo/product_repository_impl.dart';
import 'package:bootx_app/features/home/domain/repo/category_repository.dart';
import 'package:bootx_app/features/home/domain/repo/product_repository.dart';
import 'package:bootx_app/features/home/domain/usecase/get_categories_usecase.dart';
import 'package:bootx_app/features/home/domain/usecase/get_product_usecase.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_category/bloc_category_bloc.dart';
import 'package:bootx_app/features/home/presentation/controller/bloc_product/product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton<Dio>(() => ApiDioConfig.createDio());
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl(getIt<Dio>()));

  // Sign In Feature
  getIt.registerLazySingleton<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SignInRepository>(
    () =>
        SignInRepositoryImpl(remoteDataSource: getIt<SignInRemoteDataSource>()),
  );
  getIt.registerFactory<SignInBloc>(
    () => SignInBloc(getIt<SignInRepository>()),
  );

  // Sign Up Feature
  getIt.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SignUpRepository>(
    () =>
        SignUpRepositoryImpl(remoteDataSource: getIt<SignUpRemoteDataSource>()),
  );
  getIt.registerFactory<SignUpBloc>(
    () => SignUpBloc(repository: getIt<SignUpRepository>()),
  );

  // Category Feature
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt<CategoryRemoteDataSource>()),
  );
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(getIt<CategoryRepository>()),
  );
  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(getCategoriesUseCase: getIt<GetCategoriesUseCase>()),
  );

  // Product Feature
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<ProductRemoteDataSource>()),
  );
  getIt.registerLazySingleton<GetProductUseCase>(
    () => GetProductUseCase(getIt<ProductRepository>()),
  );
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(getProductUseCase: getIt<GetProductUseCase>()),
  );
}

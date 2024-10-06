// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../api%20manager/api_manager.dart' as _i480;
import '../../auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i242;
import '../../auth/data/data_source/remote/base_auth_remote_data_source.dart'
    as _i806;
import '../../auth/data/repository/auth_repo_impl.dart' as _i869;
import '../../auth/domain/repository/base_auth_repo.dart' as _i527;
import '../../auth/domain/usecases/login_use_case.dart' as _i694;
import '../../auth/domain/usecases/register_use_case.dart' as _i664;
import '../../auth/presentation/controllers/login_cubit/login_cubit.dart'
    as _i800;
import '../../auth/presentation/controllers/register_cubit/register_cubit.dart'
    as _i301;
import '../../home_tab/data/data_source/remote/base_remote_home_tab_data_source.dart'
    as _i8;
import '../../home_tab/data/data_source/remote/remote_home_tab_data_source_impl.dart'
    as _i775;
import '../../home_tab/data/rpo/home_tab_repo_impl.dart' as _i992;
import '../../home_tab/domain/repo/base_home_tab_repo.dart' as _i815;
import '../../home_tab/domain/use_case/get_all_brands_use_case.dart' as _i59;
import '../../home_tab/domain/use_case/get_all_categories_use_case.dart'
    as _i566;
import '../../home_tab/presentation/controller/home_tab_cubit/home_tab_cubit.dart'
    as _i946;
import '../data/data_sources/remote/base_remote_bottom_navigation_bar_data_source.dart'
    as _i1009;
import '../data/data_sources/remote/remote_bottom_navigation_bar_data_source_impl.dart'
    as _i566;
import '../data/repo/bottom_navigation_bar_repo_impl.dart' as _i125;
import '../domain/repo/base_bottom_navigation_bar_repo.dart' as _i1012;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i994;
import '../presentation/controller/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart'
    as _i342;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i480.ApiManager>(() => _i480.ApiManager());
    gh.factory<_i806.BaseAuthRemoteDataSource>(
        () => _i242.AuthRemoteDataSourceImpl());
    gh.factory<_i1009.BaseRemoteBottomNavigationBarDataSource>(
        () => _i566.RemoteBottomNavigationBarDataSourceImpl());
    gh.factory<_i8.BaseRemoteHomeTabDataSource>(
        () => _i775.RemoteHomeTabDataSourceImpl());
    gh.factory<_i815.BaseHomeTabRepo>(() => _i992.HomeTabRepoImpl(
        baseRemoteHomeTabDataSource: gh<_i8.BaseRemoteHomeTabDataSource>()));
    gh.factory<_i1012.BaseBottomNavigationBarRepo>(() =>
        _i125.BottomNavigationBarRepoImpl(
            baseRemoteBottomNavigationBarDataSource:
                gh<_i1009.BaseRemoteBottomNavigationBarDataSource>()));
    gh.factory<_i527.BaseAuthRepo>(() => _i869.AuthRepoImpl(
        baseAuthRemoteDataSource: gh<_i806.BaseAuthRemoteDataSource>()));
    gh.factory<_i59.GetAllBrandsUseCase>(() =>
        _i59.GetAllBrandsUseCase(baseHomeTabRepo: gh<_i815.BaseHomeTabRepo>()));
    gh.factory<_i566.GetAllCategoriesUseCase>(() =>
        _i566.GetAllCategoriesUseCase(
            baseHomeTabRepo: gh<_i815.BaseHomeTabRepo>()));
    gh.factory<_i694.LoginUseCase>(
        () => _i694.LoginUseCase(baseAuthRepo: gh<_i527.BaseAuthRepo>()));
    gh.factory<_i664.RegisterUseCase>(
        () => _i664.RegisterUseCase(baseAuthRepo: gh<_i527.BaseAuthRepo>()));
    gh.factory<_i994.AddToCartUseCase>(() => _i994.AddToCartUseCase(
        baseBottomNavigationBarRepo: gh<_i1012.BaseBottomNavigationBarRepo>()));
    gh.factory<_i946.HomeTabCubit>(() => _i946.HomeTabCubit(
          getAllCategoriesUseCase: gh<_i566.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i800.LoginCubit>(
        () => _i800.LoginCubit(gh<_i694.LoginUseCase>()));
    gh.factory<_i301.RegisterCubit>(() =>
        _i301.RegisterCubit(registerUseCase: gh<_i664.RegisterUseCase>()));
    gh.factory<_i342.BottomNavigationBarCubit>(() =>
        _i342.BottomNavigationBarCubit(
            addToCartUseCase: gh<_i994.AddToCartUseCase>()));
    return this;
  }
}

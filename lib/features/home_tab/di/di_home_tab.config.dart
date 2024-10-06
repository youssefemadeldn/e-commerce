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
import '../../bottom_navigation_bar/data/data_sources/remote/base_remote_bottom_navigation_bar_data_source.dart'
    as _i761;
import '../../bottom_navigation_bar/data/data_sources/remote/remote_bottom_navigation_bar_data_source_impl.dart'
    as _i288;
import '../../bottom_navigation_bar/data/repo/bottom_navigation_bar_repo_impl.dart'
    as _i930;
import '../../bottom_navigation_bar/domain/repo/base_bottom_navigation_bar_repo.dart'
    as _i990;
import '../../bottom_navigation_bar/domain/use_cases/add_to_cart_use_case.dart'
    as _i1039;
import '../../bottom_navigation_bar/presentation/controller/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart'
    as _i8;
import '../data/data_source/remote/base_remote_home_tab_data_source.dart'
    as _i152;
import '../data/data_source/remote/remote_home_tab_data_source_impl.dart'
    as _i766;
import '../data/rpo/home_tab_repo_impl.dart' as _i462;
import '../domain/repo/base_home_tab_repo.dart' as _i944;
import '../domain/use_case/get_all_brands_use_case.dart' as _i797;
import '../domain/use_case/get_all_categories_use_case.dart' as _i28;
import '../presentation/controller/home_tab_cubit/home_tab_cubit.dart' as _i473;

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
    gh.factory<_i761.BaseRemoteBottomNavigationBarDataSource>(
        () => _i288.RemoteBottomNavigationBarDataSourceImpl());
    gh.factory<_i152.BaseRemoteHomeTabDataSource>(
        () => _i766.RemoteHomeTabDataSourceImpl());
    gh.factory<_i944.BaseHomeTabRepo>(() => _i462.HomeTabRepoImpl(
        baseRemoteHomeTabDataSource: gh<_i152.BaseRemoteHomeTabDataSource>()));
    gh.factory<_i990.BaseBottomNavigationBarRepo>(() =>
        _i930.BottomNavigationBarRepoImpl(
            baseRemoteBottomNavigationBarDataSource:
                gh<_i761.BaseRemoteBottomNavigationBarDataSource>()));
    gh.factory<_i527.BaseAuthRepo>(() => _i869.AuthRepoImpl(
        baseAuthRemoteDataSource: gh<_i806.BaseAuthRemoteDataSource>()));
    gh.factory<_i797.GetAllBrandsUseCase>(() => _i797.GetAllBrandsUseCase(
        baseHomeTabRepo: gh<_i944.BaseHomeTabRepo>()));
    gh.factory<_i28.GetAllCategoriesUseCase>(() => _i28.GetAllCategoriesUseCase(
        baseHomeTabRepo: gh<_i944.BaseHomeTabRepo>()));
    gh.factory<_i694.LoginUseCase>(
        () => _i694.LoginUseCase(baseAuthRepo: gh<_i527.BaseAuthRepo>()));
    gh.factory<_i664.RegisterUseCase>(
        () => _i664.RegisterUseCase(baseAuthRepo: gh<_i527.BaseAuthRepo>()));
    gh.factory<_i1039.AddToCartUseCase>(() => _i1039.AddToCartUseCase(
        baseBottomNavigationBarRepo: gh<_i990.BaseBottomNavigationBarRepo>()));
    gh.factory<_i473.HomeTabCubit>(() => _i473.HomeTabCubit(
          getAllCategoriesUseCase: gh<_i28.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i797.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i800.LoginCubit>(
        () => _i800.LoginCubit(gh<_i694.LoginUseCase>()));
    gh.factory<_i301.RegisterCubit>(() =>
        _i301.RegisterCubit(registerUseCase: gh<_i664.RegisterUseCase>()));
    gh.factory<_i8.BottomNavigationBarCubit>(() => _i8.BottomNavigationBarCubit(
        addToCartUseCase: gh<_i1039.AddToCartUseCase>()));
    return this;
  }
}

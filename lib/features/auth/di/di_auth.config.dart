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
import '../data/data_source/remote/auth_remote_data_source_impl.dart' as _i57;
import '../data/data_source/remote/base_auth_remote_data_source.dart' as _i898;
import '../data/repository/auth_repo_impl.dart' as _i231;
import '../domain/repository/base_auth_repo.dart' as _i296;
import '../domain/usecases/login_use_case.dart' as _i646;
import '../domain/usecases/register_use_case.dart' as _i744;
import '../presentation/controllers/login_cubit/login_cubit.dart' as _i900;
import '../presentation/controllers/register_cubit/register_cubit.dart'
    as _i1006;

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
    gh.factory<_i898.BaseAuthRemoteDataSource>(
        () => _i57.AuthRemoteDataSourceImpl());
    gh.factory<_i761.BaseRemoteBottomNavigationBarDataSource>(
        () => _i288.RemoteBottomNavigationBarDataSourceImpl());
    gh.factory<_i8.BaseRemoteHomeTabDataSource>(
        () => _i775.RemoteHomeTabDataSourceImpl());
    gh.factory<_i815.BaseHomeTabRepo>(() => _i992.HomeTabRepoImpl(
        baseRemoteHomeTabDataSource: gh<_i8.BaseRemoteHomeTabDataSource>()));
    gh.factory<_i990.BaseBottomNavigationBarRepo>(() =>
        _i930.BottomNavigationBarRepoImpl(
            baseRemoteBottomNavigationBarDataSource:
                gh<_i761.BaseRemoteBottomNavigationBarDataSource>()));
    gh.factory<_i296.BaseAuthRepo>(() => _i231.AuthRepoImpl(
        baseAuthRemoteDataSource: gh<_i898.BaseAuthRemoteDataSource>()));
    gh.factory<_i59.GetAllBrandsUseCase>(() =>
        _i59.GetAllBrandsUseCase(baseHomeTabRepo: gh<_i815.BaseHomeTabRepo>()));
    gh.factory<_i566.GetAllCategoriesUseCase>(() =>
        _i566.GetAllCategoriesUseCase(
            baseHomeTabRepo: gh<_i815.BaseHomeTabRepo>()));
    gh.factory<_i646.LoginUseCase>(
        () => _i646.LoginUseCase(baseAuthRepo: gh<_i296.BaseAuthRepo>()));
    gh.factory<_i744.RegisterUseCase>(
        () => _i744.RegisterUseCase(baseAuthRepo: gh<_i296.BaseAuthRepo>()));
    gh.factory<_i1039.AddToCartUseCase>(() => _i1039.AddToCartUseCase(
        baseBottomNavigationBarRepo: gh<_i990.BaseBottomNavigationBarRepo>()));
    gh.factory<_i946.HomeTabCubit>(() => _i946.HomeTabCubit(
          getAllCategoriesUseCase: gh<_i566.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i900.LoginCubit>(
        () => _i900.LoginCubit(gh<_i646.LoginUseCase>()));
    gh.factory<_i1006.RegisterCubit>(() =>
        _i1006.RegisterCubit(registerUseCase: gh<_i744.RegisterUseCase>()));
    gh.factory<_i8.BottomNavigationBarCubit>(() => _i8.BottomNavigationBarCubit(
        addToCartUseCase: gh<_i1039.AddToCartUseCase>()));
    return this;
  }
}

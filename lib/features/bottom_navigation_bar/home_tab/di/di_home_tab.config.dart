// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../../api%20manager/api_manager.dart' as _i509;
import '../../../auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i287;
import '../../../auth/data/data_source/remote/base_auth_remote_data_source.dart'
    as _i863;
import '../../../auth/data/repository/auth_repo_impl.dart' as _i216;
import '../../../auth/domain/repository/base_auth_repo.dart' as _i142;
import '../../../auth/domain/usecases/login_use_case.dart' as _i14;
import '../../../auth/domain/usecases/register_use_case.dart' as _i138;
import '../../../auth/presentation/controllers/login_cubit/login_cubit.dart'
    as _i501;
import '../../../auth/presentation/controllers/register_cubit/register_cubit.dart'
    as _i451;
import '../data/data_source/remote/base_remote_home_tab_data_source.dart'
    as _i152;
import '../data/data_source/remote/remote_home_tab_data_source_impl.dart'
    as _i766;
import '../data/rpo/home_tab_repo_impl.dart' as _i462;
import '../domain/repo/base_home_tab_repo.dart' as _i944;
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
    gh.singleton<_i509.ApiManager>(() => _i509.ApiManager());
    gh.factory<_i863.BaseAuthRemoteDataSource>(
        () => _i287.AuthRemoteDataSourceImpl());
    gh.factory<_i152.BaseRemoteHomeTabDataSource>(
        () => _i766.RemoteHomeTabDataSourceImpl());
    gh.factory<_i142.BaseAuthRepo>(() => _i216.AuthRepoImpl(
        baseAuthRemoteDataSource: gh<_i863.BaseAuthRemoteDataSource>()));
    gh.factory<_i944.BaseHomeTabRepo>(() => _i462.HomeTabRepoImpl(
        baseRemoteHomeTabDataSource: gh<_i152.BaseRemoteHomeTabDataSource>()));
    gh.factory<_i14.LoginUseCase>(
        () => _i14.LoginUseCase(baseAuthRepo: gh<_i142.BaseAuthRepo>()));
    gh.factory<_i138.RegisterUseCase>(
        () => _i138.RegisterUseCase(baseAuthRepo: gh<_i142.BaseAuthRepo>()));
    gh.factory<_i28.GetAllCategoriesUseCase>(() => _i28.GetAllCategoriesUseCase(
        baseHomeTabRepo: gh<_i944.BaseHomeTabRepo>()));
    gh.factory<_i501.LoginCubit>(
        () => _i501.LoginCubit(gh<_i14.LoginUseCase>()));
    gh.factory<_i451.RegisterCubit>(() =>
        _i451.RegisterCubit(registerUseCase: gh<_i138.RegisterUseCase>()));
    gh.factory<_i473.HomeTabCubit>(() => _i473.HomeTabCubit(
        getAllCategoriesUseCase: gh<_i28.GetAllCategoriesUseCase>()));
    return this;
  }
}

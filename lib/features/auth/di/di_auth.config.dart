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
import '../data/data_source/remote/auth_remote_data_source_impl.dart' as _i57;
import '../data/data_source/remote/base_auth_remote_data_source.dart' as _i898;
import '../data/repository/auth_repo_impl.dart' as _i231;
import '../domain/repository/base_auth_repo.dart' as _i296;
import '../domain/usecases/register_use_case.dart' as _i744;
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
    gh.factory<_i296.BaseAuthRepo>(() => _i231.AuthRepoImpl(
        baseAuthRemoteDataSource: gh<_i898.BaseAuthRemoteDataSource>()));
    gh.factory<_i744.RegisterUseCase>(
        () => _i744.RegisterUseCase(baseAuthRepo: gh<_i296.BaseAuthRepo>()));
    gh.factory<_i1006.RegisterCubit>(() =>
        _i1006.RegisterCubit(registerUseCase: gh<_i744.RegisterUseCase>()));
    return this;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/fact_client.dart' as _i4;
import '../cubit/facts_list_view/facts_list_view_cubit.dart' as _i8;
import '../cubit/random_fact_view/random_fact_view_cubit.dart' as _i7;
import '../services/fact_service.dart' as _i5;
import '../services/facts_storage.dart' as _i6;
import 'modules/fact_module.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final factModule = _$FactModule();
  gh.lazySingleton<_i3.Dio>(() => factModule.dio());
  gh.lazySingleton<_i4.FactClient>(() => factModule.factClient(get<_i3.Dio>()));
  gh.factory<_i5.FactService>(() => _i5.FactService(get<_i4.FactClient>()));
  await gh.factoryAsync<_i6.FactsStorage>(() => _i6.FactsStorage.create(),
      preResolve: true);
  gh.factory<_i7.RandomFactViewCubit>(() => _i7.RandomFactViewCubit(
      factsStorage: get<_i6.FactsStorage>(),
      factService: get<_i5.FactService>()));
  gh.factory<_i8.FactsListViewCubit>(
      () => _i8.FactsListViewCubit(factsStorage: get<_i6.FactsStorage>()));
  return get;
}

class _$FactModule extends _i9.FactModule {}

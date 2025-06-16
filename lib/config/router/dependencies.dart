part of 'app_router.dart';

//! dio
final _tokensRepo = TokensRepo(TokensService());
final _headers = RequestHeaders();
final _connectionHelper = InternetConnectionHelper();
final _dioHelper = DioHelper(_headers, _connectionHelper);
//!auth
final _authService = AuthServiceImpl(_dioHelper);
final _authRepoImpl = AuthRepoImpl(_authService);
final _authBloc = AuthBloc(_authRepoImpl, _tokensRepo);
final _codeVerificationCubit = CodeVerificationCubit(_authRepoImpl);

//!addons
final _addonsServiceImpl = AddonsServiceImpl(_dioHelper);
final _addonsRepo = AddonsRepoImpl(_addonsServiceImpl, _tokensRepo);

//!locations
final _locationsService = LocationsServiceImpl(_dioHelper);
final _locationsRepoImpl = LocationsRepoImpl(_locationsService, _tokensRepo);
final _zonesService = ZonesServiceImpl(_dioHelper);
final _zonesRepoImpl = ZonesRepoImpl(_zonesService, _tokensRepo);
final _zonesCubit = ZonesCubit(_zonesRepoImpl);
final _locationsCubit = LocationsCubit(_locationsRepoImpl);

//!packages
final _packagesService = PackagesServiceImpl(_dioHelper);
final _packagesRepo = PackagesRepoImpl(_packagesService);

//!cars
final _carsService = CarsServiceImpl(_dioHelper);
final _carsRepo = CarsRepoImpl(_carsService, _tokensRepo);
final _carsBloc = CarsBloc(_carsRepo);

//!banners

final _bannersService = BannersServiceImpl(_dioHelper);
final _bannersRepo = BannersRepoImpl(_bannersService);

import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/features/home/data/repo_impl/banners_repo_impl.dart';
import 'package:ashafaq/features/home/domain/entities/i_banner.dart';
import 'package:ashafaq/features/home/domain/i_repo/i_banners_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> implements IBannersRepo {
  final BannersRepoImpl _bannersRepo;
  BannersCubit(this._bannersRepo) : super(const BannersInitialState());

  @override
  void getBanners() async {
    try {
      emit(const BannersLoadingState());
      final banners = await _bannersRepo.getBanners();
      if (banners.isEmpty) {
        emit(const NoBannersState());
        return;
      }
      emit(GotBannersState(banners));
    } on BaseException catch (e) {
      emit(BannersFailureState(e.message ?? ''));
    } catch (e) {
      emit(BannersFailureState(e.toString()));
    }
  }
}

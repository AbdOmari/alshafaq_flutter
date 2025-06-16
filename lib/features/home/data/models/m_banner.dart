import 'package:ashafaq/features/home/domain/entities/i_banner.dart';
import 'package:json_annotation/json_annotation.dart';
part 'm_banner.g.dart';

@JsonSerializable()
final class MBanner extends IBanner {
  const MBanner(super.id, super.imageUrl, super.description, super.title);

  factory MBanner.fromJson(json) => _$MBannerFromJson(json);

  static List<IBanner> fromJsonList(List json) =>
      json.map((item) => MBanner.fromJson(item)).toList();
}

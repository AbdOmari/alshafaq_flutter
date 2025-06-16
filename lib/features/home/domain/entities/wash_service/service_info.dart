import 'package:equatable/equatable.dart';

final class ServiceInfo extends Equatable {
  final String _name;
  final String _image;
  const ServiceInfo({required String name, required String image})
    : _name = name,
      _image = image;

  String get name => _name;
  String get image => _image;
  @override
  List<Object?> get props => [_name, _image];
}

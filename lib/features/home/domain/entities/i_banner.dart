import 'package:equatable/equatable.dart';

class IBanner extends Equatable {
  final int id;
  final String? title;
  final String imageUrl;
  final String? description;
  const IBanner(this.id, this.imageUrl, this.description, this.title);
  @override
  List<Object?> get props => [id, title, imageUrl, description];
}

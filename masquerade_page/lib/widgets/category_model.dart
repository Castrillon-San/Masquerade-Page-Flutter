import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imagePath;

  const Category({required this.name, required this.imagePath});

  @override
  List<Object?> get props => [name, imagePath];

  static const List<Category> categories = [
    Category(
        name: "¡Resuelve puzzles!", imagePath: "assets/images/PuzzleImage.png"),
    Category(
        name: "Habla con los aldeanos",
        imagePath: "assets/images/CharacterImage.png"),
    Category(
        name: "¡Ven y visita las patris!",
        imagePath: "assets/images/Patris.png"),
    Category(
        name: "Escribe tu propio diario", imagePath: "assets/images/Diary.png"),
    Category(
        name: "Recorre el pueblo y descubre lugares maravillosos",
        imagePath: "assets/images/FarmImage.png"),
  ];
}

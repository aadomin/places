///
/// Доменный слой приложения. Базовая бизнес-логика
/// Модель категории
///
class CategoryItem {
  CategoryItem({
    required this.name,
    required this.isSelected,
  });

  String name;
  bool isSelected;

  @override
  String toString() {
    return '$name $isSelected';
  }
}

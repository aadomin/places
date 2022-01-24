class FilterItem {
  FilterItem({
    required this.name,
    required this.assetPath,
    required this.isSelected,
  });

  String name = '';
  String assetPath = '';
  bool isSelected = true;

  @override
  String toString() {
    return '$name $assetPath $isSelected';
  }
}

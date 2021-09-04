class Sight {
  Sight({
    required this.id,
    required this.wished,
    required this.seen,
    this.name = 'Example object',
    this.lat = 0,
    this.lon = 0,
    this.url = 'http:',
    this.details = 'Description',
    this.type = 'Type',
    this.timeOfWork = 'Закрыто до 09:00',
  });

  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final String type;
  final String timeOfWork;
  bool wished;
  bool seen;
  final int id;

  @override
  String toString() {
    return '$name $lat $lon $url $details $type';
  }
}


// Подключите к нему PlaceRepository, реализуйте следующий функционал:
// getPlaces(radius:int, category: String): List получение списка интересных мест. Список должен фильтроваться по удаленности от пользователя. Для выполнения задачи, можно воспользоваться одним из решений со stackoverflow
// getPlaceDetails(id:int): Place - возвращает детализацию места
// getFavoritesPlaces() - получить список избранных мест, отсортированных по удаленности
// addToFavorites(place:Place) - добавить место в список избранного
// removeFromFavorites(place:Place) - удалить место из списка избранного
// getVisitPlaces() - показать посещенные места
// addToVisitingPlaces(place) - добавить в посещенные
// addNewPlace(place) - добавить новое место

// На текущий момент хранение достопримечательностей выполните в списках интерактора. Когда пройдем "Тема 15. Хранение данных" реализуете сохранение мест в базе данных.
// Подключите фукнционал интерактора к следующим местам:

// список интересных мест - getPlaces
// экран детализации - getPlaceDetails
// экран "Хочу посетить" - getFavoritesPlaces
// кнопка "Добавить в избранное" в карточке на экране "Список интересных мест", кнопка "Добавить в избранное" на экране детализации   - addToFavorites
// Если место уже в избранном, по повторному нажатию - removeFromFavorites
// Экран посещенных мест - getVisitPlaces
// После реализации карты добавите addToVisitingPlaces после завершения маршрута
// Экран "Добавить новое место" - addNewPlace
///
/// Обеспечивает логику добавления в историю поиска нового запроса
///
class HistoryOfSearchServices {
  ///
  /// Обеспечивает логику добавления в историю поиска нового запроса. Принимает:
  /// - новый запрос,
  /// - историю запросов и
  /// - максимально возможное количество пунктов в истории.
  ///
  /// Возвращает новую историю запросов.
  ///
  /// Первый элемент в листе [0] - крайний по времени!
  /// lastSearches - не должен содержать пустых элементов.
  ///
  static List<String> newListOfLastSearches({
    required String newInput,
    required List<String> lastSearches,
    required int maxCountOfItems,
  }) {
    final List<String> history = [...lastSearches];

    // если запрос пустой - запоминать его не нужно
    if (newInput == '') return history;

    // если вдруг массив прошлых содержит пустые элементы - удаляем их, чтобы дальше
    // не было ошибок
    for (var i = 0; i < history.length; i++) {
      if (history[i] == '') {
        history.removeAt(i);
      }
    }

    // если список прошлых (был или оказался) пустой
    // - сразу сохраняем в него первый элемент
    if (history.isEmpty) return [newInput];

    // если запрос является подстрокой последнего - запоминать не нужно
    // но НУЖНО пересортировать
    // именно такой порядок if, чтобы не обратиться к несуществующему индексу!
    //
    //
    if (newInput.length <= history[0].length) {
      if (newInput == history[0].substring(0, newInput.length)) {
        return history;
      }
    }

    // если последний сохраненный является подстрокой запроса - заменим его
    // но НУЖНО пересортировать
    // именно такой порядок if, чтобы не обратиться к несуществующему индексу!
    //
    //
    if (newInput.length >= history[0].length) {
      if (history[0] == newInput.substring(0, history[0].length)) {
        history[0] = newInput;
        return history;
      }
    }

    // иначе - ДОБАВЛЯЕМ в сохраненные
    // и если их стало больше максимального количества - удаляем последний
    history.insert(0, newInput);
    if (history.length > maxCountOfItems) {
      history.removeAt(history.length - 1);
    }
    return [...history];
  }
}

part of presentation.providers.search;

final searchQueryProvider = StateProvider<String>((ref) => '');

typedef SearchResultCallback = Future<List<Result>> Function(String query);

class SearchResultnotifier extends StateNotifier<List<Result>> {
  SearchResultnotifier({
    required this.searchResults,
    required this.ref,
  }) : super([]);

  final SearchResultCallback searchResults;
  final Ref ref;

  Future<List<Result>> searchResultByQuery(String query) async {
    try {
      final List<Result> results = await searchResults(query);
      ref.read(searchQueryProvider.notifier).update((state) => query);

      state = results;
      return results;
    } catch (_) {
      ref.read(locationsProvider.notifier).searchError('search error');
      throw ResultnotFound('search error');
    }
  }
}

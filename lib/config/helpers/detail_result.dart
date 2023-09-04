part of config.helpers;

Future<void> detailResultRead({
  required WidgetRef ref,
  required String detail,
  required String id,
}) async {
  switch (detail) {
    case 'episode':
      return ref.read(episodesProvider.notifier).loadEpisodeId(id);

    case 'location':
      return ref.read(locationsProvider.notifier).loadLocationId(id);

    case 'character':
    default:
      return ref.read(charactersProvider.notifier).loadCharacterId(id);
  }
}

Map<String, Result>? detailResultWatch(
    WidgetRef ref, String detail, String id) {
  switch (detail) {
    case 'episode':
      final data = ref.watch(episodesProvider).resultsMap;
      return data;
    case 'location':
      final data = ref.watch(locationsProvider).resultsMap;
      return data;
    case 'character':
    default:
      final data = ref.watch(charactersProvider).resultsMap;
      return data;
  }
}

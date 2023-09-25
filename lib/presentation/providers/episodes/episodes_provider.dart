part of presentation.providers.episodes;

final episodesRepositoryProvider = Provider((ref) {
  return EpisodeRepositoryImpl(EpisodeDatasourceImpl());
});

final episodesProvider =
    StateNotifierProvider<EpisodesNotifier, EpisodeState>((ref) {
  return EpisodesNotifier(
    episodeRepository: ref.watch(episodesRepositoryProvider),
  );
});

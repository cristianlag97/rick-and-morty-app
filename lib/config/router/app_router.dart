part of config.router;

final goRouterProvider = Provider((ref) {
  final goRouterProvider = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterProvider,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckNetworkScreen(),
      ),
      GoRoute(
        path: '/without-connection',
        builder: (context, state) => const WithoutConnection(),
      ),
      GoRoute(
          path: '/home/:page',
          builder: (context, state) {
            return const HomeScreen();
          }),
      GoRoute(
        path: '/result/:id/:provider',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? 'no-id';
          final provider = state.pathParameters['provider'] ?? 'no-provider';
          return DetailsScreen(
            resultId: id,
            provider: provider,
          );
        },
      )
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final connectionStatus = goRouterProvider.connectServices;
      if (isGoingTo == '/splash' &&
          connectionStatus == ConnectibityApp.checking) {
        return null;
      }
      if (connectionStatus == ConnectibityApp.connect) {
        if (isGoingTo == '/splash' || isGoingTo == '/without-connection') {
          return '/home/0';
        }
      }
      if (connectionStatus == ConnectibityApp.unConnect) {
        return '/without-connection';
      }
      return null;
    },
  );
});

import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';
        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        GoRoute(
          path: 'result/:id/:provider',
          name: DetailsScreen.name,
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
    ),
    GoRoute(path: '/', redirect: (_, __) => '/home/0'),
  ],
);

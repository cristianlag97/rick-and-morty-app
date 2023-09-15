part of presentation.screen;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const name = 'home-rick&morty';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = <Widget>[
    const CharacterView(),
    const EpisodeView(),
    const LocationView()
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final connectivityState = ref.watch(appProviderState);
    // final isConnect = connectivityState.hasNetwork;

    if (pageController.hasClients) {
      pageController.animateToPage(
        connectivityState.currentPage,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
      pageController.initialPage;
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar:
          CustomBottomNavigation(currentIndex: connectivityState.currentPage),
    );
    // : const WithoutConnection();
  }

  @override
  bool get wantKeepAlive => true;
}

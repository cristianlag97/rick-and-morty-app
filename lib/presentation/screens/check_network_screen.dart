part of presentation.screen;

class CheckNetworkScreen extends StatelessWidget {
  const CheckNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

part of presentation.screen;

class WithoutConnection extends StatelessWidget {
  const WithoutConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.network_check_outlined, size: size30, color: colorDead),
            Text('Without Internet'),
          ],
        ),
      ),
    );
  }
}

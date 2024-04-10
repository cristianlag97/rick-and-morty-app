part of presentation.widgets;

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: paddingHorizontal16,
        child: Column(
          children: [
            gap16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ShimmerLoading(
                  child: Container(
                    width: size.width * 0.25,
                    height: size.height * 0.04,
                    decoration: const BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                ShimmerLoading(
                  child: Container(
                    width: size.width * 0.25,
                    height: size.height * 0.04,
                    decoration: const BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
            gapy4,
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, __) => ShimmerLoading(
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                separatorBuilder: (_, __) => gapy16,
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

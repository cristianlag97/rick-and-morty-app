import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty_app/config/constants/constants.dart';
import 'package:rick_and_morty_app/infraestructure/infraestructure.dart';
import 'package:rick_and_morty_app/presentation/providers/provider.dart';

import '../../domain/domain.dart';

typedef SearchResultsCallback = Future<List<Result>> Function(String query);

class SearchResultDelegate extends SearchDelegate<Result?> {
  SearchResultDelegate({
    required this.searchResults,
    required this.initialResults,
  }) : super(
            searchFieldLabel: 'Search',
            searchFieldStyle: const TextStyle(fontSize: size18));

  final SearchResultsCallback searchResults;
  List<Result> initialResults = [];

  StreamController<List<Result>> debouncedResult = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  void _onQueryChanged(String query) {
    try {
      isLoadingStream.add(true);
      if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

      _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
        final results = await searchResults(query);
        debouncedResult.add(results);
        initialResults = results;
        isLoadingStream.add(false);
      });
    } catch (e) {
      throw ResultnotFound('search error');
    }
  }

  void clearStreams() {
    debouncedResult.close();
  }

  Widget buildResultsAndSuggestions() => StreamBuilder(
        initialData: initialResults,
        stream: debouncedResult.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Result>> snapshot) {
          final results = snapshot.data ?? [];
          return ListView.builder(
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                if (query == '') return const SizedBox();
                return _ResultItem(
                  result: results[index],
                  onResultSelected: (context, result) {
                    clearStreams();
                    close(context, result);
                  },
                );
              });
        },
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              duration: const Duration(seconds: 20),
              spins: 10,
              infinite: true,
              child: IconButton(
                onPressed: () => query = '',
                icon: const Icon(Icons.refresh),
              ),
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
              onPressed: () => query = '',
              icon: const Icon(Icons.clear),
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        clearStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) => buildResultsAndSuggestions();

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _ResultItem extends ConsumerWidget {
  const _ResultItem({required this.result, required this.onResultSelected});

  final Result result;
  final Function onResultSelected;

  void showSnackbar(BuildContext context, String messageError) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(messageError)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    ref.listen(locationsProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    return GestureDetector(
      onTap: () {
        onResultSelected(context, result);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            gapx8,
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('- ${result.name}', style: textStyle.titleSmall),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

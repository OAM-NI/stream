import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:stream/models/models.dart';
import 'package:stream/providers/movies_provider.dart';
import 'package:stream/search/search_delegate.dart';
//import 'package:stream/widgets/card_swiper.dart';
import 'package:stream/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviep = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Películas en cines')),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: Icon(Icons.search_outlined)),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            CardSwiper(movies: moviep.onDisplayMovies),
            MovieSlider(
              onNextPage: () => moviep.getPopularMovies(),
              movies: moviep.popularMovies,
              tittle: 'Populares',
            ),
          ],
        )));
  }
}

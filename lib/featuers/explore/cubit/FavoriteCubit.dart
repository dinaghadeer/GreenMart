import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/procucts.dart';

class FavoriteCubit extends Cubit<List<Products>> {

  FavoriteCubit() : super([]);

  void toggle(Products product){

    final favorites = List<Products>.from(state);

    if(favorites.contains(product)){
      favorites.remove(product);
    }else{
      favorites.add(product);
    }

    emit(favorites);
  }

}
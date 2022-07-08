abstract class HotelDescriptionState {}

class HotelDescriptionInitial extends HotelDescriptionState {}

class HotelDescriptionIsLikeState extends HotelDescriptionState {
  final bool isLiked;
  HotelDescriptionIsLikeState({required this.isLiked});
}

class HotelDescriptionIsReadMoreState extends HotelDescriptionState {
  final bool isReadMore;
  HotelDescriptionIsReadMoreState({required this.isReadMore});
}

class HotelDescriptionIndicatorIndexState extends HotelDescriptionState {
  final int index;
  HotelDescriptionIndicatorIndexState({required this.index});
}

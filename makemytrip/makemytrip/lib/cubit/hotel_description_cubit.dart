import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makemytrip/hotel_decription.dart';
import 'hotel_description_state.dart';

class HotelDescriptionCubit extends Cubit<HotelDescriptionState> {
  bool islike = false;
  HotelDescriptionCubit() : super(HotelDescriptionInitial());

  onLikeTap(bool isLiked) {
    emit(HotelDescriptionIsLikeState(isLiked: !isLiked));
  }

  onReadMoreTap(bool isReadMore) {
    emit(HotelDescriptionIsReadMoreState(isReadMore: !isReadMore));
  }

  onSwipeIndicator(index) {
    emit(HotelDescriptionIndicatorIndexState(index: index));
  }
}

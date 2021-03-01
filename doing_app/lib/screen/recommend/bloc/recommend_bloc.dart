import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recommend_event.dart';

part 'recommend_state.dart';

class RecommendBloc extends Bloc<RecommendEvent, RecommendState> {
  RecommendBloc(RecommendState initialState) : super(initialState);

  @override
  RecommendState get initialState => InitialRecommendState();

  @override
  Stream<RecommendState> mapEventToState(RecommendEvent event) async* {
    // TODO: Add your event logic
  }
}

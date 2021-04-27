import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'community_event.dart';

part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc(CommunityState initialState) : super(initialState);

  @override
  CommunityState get initialState => InitialCommunityState();

  @override
  Stream<CommunityState> mapEventToState(CommunityEvent event) async* {
    // TODO: Add your event logic
  }
}

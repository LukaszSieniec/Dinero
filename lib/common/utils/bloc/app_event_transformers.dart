import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

// Process only one event and ignore (drop) any new events
// until the current event is done.
EventTransformer<E> throttleDroppable<E>(Duration duration) =>
    (events, mapper) => droppable<E>().call(
          events.throttle(duration),
          mapper,
        );

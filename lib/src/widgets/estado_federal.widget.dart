// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:estado_federal/src/base/estado_federal_state.dart';

class EstadoFederalWidget<T extends EstadoFederal, EstadoFederalType> extends StatelessWidget {
  final T state;
  final Widget Function(EstadoFederalType) builder;
  final Widget Function(EstadoFederalType)? onClose;
  final Widget Function(EstadoFederalType)? onError;

  const EstadoFederalWidget({
    Key? key,
    required this.state,
    required this.builder,
    this.onClose,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: state.state,
      stream: state.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError != null ? onError!.call(snapshot.error as EstadoFederalType) : const SizedBox.shrink();
        }
        if (snapshot.hasData) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return builder(snapshot.data as EstadoFederalType);
            case ConnectionState.done:
              return onClose != null ? onClose!.call(snapshot.data as EstadoFederalType) : const SizedBox.shrink();
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}

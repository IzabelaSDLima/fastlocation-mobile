// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStore on _HistoryStoreBase, Store {
  late final _$historicoAtom =
      Atom(name: '_HistoryStoreBase.historico', context: context);

  @override
  List<CepModel> get historico {
    _$historicoAtom.reportRead();
    return super.historico;
  }

  @override
  set historico(List<CepModel> value) {
    _$historicoAtom.reportWrite(value, super.historico, () {
      super.historico = value;
    });
  }

  late final _$_HistoryStoreBaseActionController =
      ActionController(name: '_HistoryStoreBase', context: context);

  @override
  void carregarHistorico() {
    final _$actionInfo = _$_HistoryStoreBaseActionController.startAction(
        name: '_HistoryStoreBase.carregarHistorico');
    try {
      return super.carregarHistorico();
    } finally {
      _$_HistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historico: ${historico}
    ''';
  }
}

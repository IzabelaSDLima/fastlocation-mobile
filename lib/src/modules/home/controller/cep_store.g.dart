// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CepStore on _CepStoreBase, Store {
  late final _$enderecoAtom =
      Atom(name: '_CepStoreBase.endereco', context: context);

  @override
  CepModel? get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(CepModel? value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CepStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CepStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$buscarCepAsyncAction =
      AsyncAction('_CepStoreBase.buscarCep', context: context);

  @override
  Future<void> buscarCep(String cep) {
    return _$buscarCepAsyncAction.run(() => super.buscarCep(cep));
  }

  late final _$_CepStoreBaseActionController =
      ActionController(name: '_CepStoreBase', context: context);

  @override
  void carregarUltimoEndereco() {
    final _$actionInfo = _$_CepStoreBaseActionController.startAction(
        name: '_CepStoreBase.carregarUltimoEndereco');
    try {
      return super.carregarUltimoEndereco();
    } finally {
      _$_CepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
endereco: ${endereco},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}

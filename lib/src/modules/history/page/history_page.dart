import 'package:fastlocation/src/shared/components/endereco_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fastlocation/src/modules/history/controller/history_store.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryStore historyStore = HistoryStore();

  @override
  void initState() {
    super.initState();
    historyStore.carregarHistorico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Consultas'),
      ),
      body: Observer(
        builder: (_) {
          if (historyStore.historico.isEmpty) {
            return const Center(child: Text('Nenhum histórico encontrado.'));
          } else {
            return ListView.builder(
              itemCount: historyStore.historico.length,
              itemBuilder: (context, index) {
                final cepModel = historyStore.historico[index];
                return EnderecoItem(
                  cepModel: cepModel,
                );
              },
            );
          }
        },
      ),
    );
  }
}

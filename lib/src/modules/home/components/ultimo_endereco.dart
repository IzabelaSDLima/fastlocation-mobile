import 'package:fastlocation/src/shared/components/endereco_item.dart';
import 'package:flutter/material.dart';
import 'package:fastlocation/src/modules/home/controller/cep_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UltimoEndereco extends StatelessWidget {
  final CepStore cepStore;

  const UltimoEndereco({super.key, required this.cepStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: _buildBoxDecoration(),
          child: cepStore.endereco != null
              ? EnderecoItem(cepModel: cepStore.endereco!)
              : _buildNoRecentAddress(),
        );
      },
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
        ),
      ],
    );
  }

  Widget _buildNoRecentAddress() {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off, size: 50, color: Colors.grey),
          const SizedBox(height: 10),
          const Text(
            'Não há locais recentes',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

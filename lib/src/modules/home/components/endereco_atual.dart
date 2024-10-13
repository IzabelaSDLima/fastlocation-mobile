import 'package:fastlocation/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fastlocation/src/modules/home/controller/cep_store.dart';

class EnderecoAtual extends StatelessWidget {
  final CepStore cepStore;

  const EnderecoAtual({super.key, required this.cepStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: cepStore.endereco != null ? Colors.grey[200] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: cepStore.endereco == null
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ]
                : null,
          ),
          child: cepStore.endereco != null
              ? _buildAddressDetails()
              : _buildInitialPrompt(),
        );
      },
    );
  }

  Widget _buildAddressDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dados da localização',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text('Logradouro: ${cepStore.endereco!.logradouro}'),
        Text('Bairro: ${cepStore.endereco!.bairro}'),
        Text('Cidade: ${cepStore.endereco!.localidade}'),
        Text('Estado: ${cepStore.endereco!.uf}'),
      ],
    );
  }

  Widget _buildInitialPrompt() {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_outlined, size: 50, color: AppColors.primary),
          const SizedBox(height: 10),
          const Text(
            'Faça uma busca para localizar seu destino',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

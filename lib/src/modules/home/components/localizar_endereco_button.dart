import 'package:fastlocation/src/modules/home/controller/cep_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocalizarEnderecoButton extends StatelessWidget {
  final TextEditingController cepController;
  final CepStore cepStore;

  const LocalizarEnderecoButton({
    super.key,
    required this.cepController,
    required this.cepStore,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return _buildModalBottomSheet(context);
            },
          );
        },
        child: const Text('Localizar endereço'),
      ),
    );
  }

  Widget _buildModalBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: cepController,
            decoration: const InputDecoration(
              labelText: 'Digite o CEP',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          Observer(
            builder: (_) {
              return cepStore.isLoading
                  ? const CircularProgressIndicator()
                  : _buildBuscarButton(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBuscarButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (cepController.text.isNotEmpty) {
          await cepStore.buscarCep(cepController.text);

          if (cepStore.errorMessage != null) {
            Fluttertoast.showToast(
              msg: cepStore.errorMessage!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          } else {
            Navigator.pop(context);
          }
        }
      },
      child: const Text('Buscar'),
    );
  }
}

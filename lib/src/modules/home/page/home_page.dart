import 'package:fastlocation/src/modules/home/components/endereco_atual.dart';
import 'package:fastlocation/src/modules/home/components/localizar_endereco_button.dart';
import 'package:fastlocation/src/modules/home/components/ultimo_endereco.dart';
import 'package:fastlocation/src/routes/app_routes.dart';
import 'package:fastlocation/src/shared/components/app_header.dart';
import 'package:flutter/material.dart';
import 'package:fastlocation/src/modules/home/controller/cep_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cepController = TextEditingController();
  final CepStore cepStore = CepStore();

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    cepStore.carregarUltimoEndereco();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppHeader(),
              const SizedBox(height: 20),
              EnderecoAtual(
                cepStore: cepStore,
              ),
              const SizedBox(height: 20),
              LocalizarEnderecoButton(
                cepController: _cepController,
                cepStore: cepStore,
              ),
              const SizedBox(height: 20),
              UltimoEndereco(cepStore: cepStore),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.history);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Ver Histórico de Consultas'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

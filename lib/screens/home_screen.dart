import 'package:flutter/material.dart';
import 'package:productos_app/providers/settings_provider.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final settingProvider = Provider.of<SettingProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: const Text("LogOut"),
                  onTap: () {
                    //vamos de nuevo a login
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pushNamed(context, 'settings');
                  },
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
            child: Text(
              "Lista de preferencias",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: PreferenceDetail(
                    icon: Icons.person, text: settingProvider.nombre),
              ),
              Expanded(
                child: PreferenceDetail(
                    icon: Icons.numbers,
                    text: settingProvider.cantidadEndulzante.toString() +
                        " de " +
                        settingProvider.endulzanteSeleccionado),
              ),
              Expanded(
                child: PreferenceDetail(
                    icon: Icons.coffee_sharp,
                    text: settingProvider.cafeSeleccionado),
              )
            ],
          )
        ],
      ),
    ));
  }
}

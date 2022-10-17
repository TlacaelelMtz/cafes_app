import 'package:flutter/material.dart';
import 'package:productos_app/providers/settings_provider.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingProvider>(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text(
            "Preferencias de :",
            style: TextStyle(fontSize: 25),
          ),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Nombre completo',
              labelText: 'Nombre',
            ),
            onChanged: (value) => settingProvider.nombre = value,
            validator: (value) {
              if (value != null && value.length >= 3) return null;
              return 'Nombre invalido';
            },
          ),
          DropdownButton(
            value: settingProvider.cafeSeleccionado,
            isExpanded: true,
            items: settingProvider.cafes
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              settingProvider.cafeSeleccionado = value.toString();
              setState(() {});
            },
          ),
          DropdownButton(
            value: settingProvider.endulzanteSeleccionado,
            isExpanded: true,
            items: settingProvider.endulzantes
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                    settingProvider.cantidadEndulzante.toInt().toString() +
                        " de " +
                        value),
              );
            }).toList(),
            onChanged: (value) {
              settingProvider.endulzanteSeleccionado = value.toString();
              setState(() {});
            },
          ),
          Slider.adaptive(
              inactiveColor: Colors.grey,
              activeColor: Colors.deepPurple,
              value: settingProvider.cantidadEndulzante,
              min: 0,
              max: 10,
              divisions: 10,
              label: settingProvider.cantidadEndulzante.round().toString(),
              onChanged: (value) {
                settingProvider.cantidadEndulzante = value;
                setState(() {});
              }),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
                fit: BoxFit.cover,
                width: size.width * 0.7,
                height: size.height * 0.3,
                image: AssetImage("assets/${settingProvider.imagenenCafe()}")),
          )
        ]),
      ),
    ));
  }
}

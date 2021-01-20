import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //gets the settings provider and assigns it to a variable
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('units'),
                DropdownButton(
                  value: settingsProvider.units,
                  items: ["Imperial", "Metric"].map<DropdownMenuItem>((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    settingsProvider.setUnits(value);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wax Lines'),
                Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: [
                      FilterChip(
                        label: Text('Swix',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                        //selection
                        selected: (settingsProvider.waxLines.contains("Swix"))
                            ? true
                            : false,
                        onSelected: (value) {
                          if (value == true) {
                            settingsProvider.addWaxLine("Swix");
                          } else {
                            settingsProvider.removeWaxLine("Swix");
                          }
                        },
                      ),
                      FilterChip(
                        label: Text('Toko',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                        //selection
                        selected: (settingsProvider.waxLines.contains("Toko"))
                            ? true
                            : false,
                        onSelected: (value) {
                          if (value == true) {
                            settingsProvider.addWaxLine("Toko");
                          } else {
                            settingsProvider.removeWaxLine("Toko");
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

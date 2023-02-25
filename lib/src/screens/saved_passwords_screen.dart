import 'package:flutter/material.dart';

import '../services/save_data_service.dart';

class SavedPasswordsScreen extends StatelessWidget {
  SavedPasswordsScreen({Key? key}) : super(key: key);

  final saveDataService = SaveDataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved passwords'),
      ),
      body: FutureBuilder(
          future: saveDataService.fetchPasswords(),
          builder: (context, snapshot) {
            final passwords = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (passwords != null && passwords.isNotEmpty) {
              return ListView.builder(
                itemCount: passwords.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(passwords[index].keys.first),
                    subtitle: SelectableText(
                      passwords[index].values.first,
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    shape: const Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.4),
                    ),
                  );
                },
              );
            } else {
              return const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'No saved passwords yet :)',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              );
            }
          }),
    );
  }
}

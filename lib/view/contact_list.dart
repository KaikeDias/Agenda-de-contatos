import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _fetch() async {
    String path = join(await getDatabasesPath(), 'banco');
    Database db = await openDatabase(path, version: 1, onCreate: (db, v) async {
      await db.execute(createTable);
      await db.execute(insert1);
      await db.execute(insert2);
      await db.execute(insert3);
    });
    return await db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetch(),
      builder: (context, futuro) {
        if (futuro.hasData) {
          dynamic lista = futuro.data;
          print(lista.toString());

          return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de contatos'),
              actions: [
                IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/ContactForm'),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                dynamic contato = lista[i];
                dynamic avatar = CircleAvatar(
                  backgroundImage: NetworkImage(contato['url_avatar']),
                );
                return ListTile(
                  title: Text(contato['nome']),
                  subtitle: Text(contato['numero']),
                  leading: avatar,
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          // return Scaffold();
          return const Center(child: Text("ERRO!"));
        }
      },
    );
  }
}

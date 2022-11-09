import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/sqlite/connection.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _fetch() async {
    Database db = await Connection.get();
    return db.query('contact');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de contatos'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/ContactForm'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
            future: _fetch(),
            builder:
                (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                var lista = snapshot.data!;
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    dynamic contato = lista[i];
                    dynamic avatar = CircleAvatar(
                      backgroundImage: NetworkImage(contato['url_avatar']),
                    );
                    return ListTile(
                      title: Text(contato['nome']),
                      subtitle: Text(contato['telefone']),
                      leading: avatar,
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('ERRO'),
                );
              }
            }));
  }
}

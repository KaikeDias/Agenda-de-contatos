import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/sqlite/dao/contact_dao_imp.dart';
import 'package:flutter_application_1/domain/entity/contact.dart';

class ContactList extends StatelessWidget {
  Future<List<Contact>> _fetch() async {
    return ContactDaoImp().find();
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
            builder: (context, futuro) {
              if (futuro.hasData) {
                List<Contact> lista = futuro.data!;
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var contato = lista[i];
                    var avatar = CircleAvatar(
                      backgroundImage: NetworkImage(contato.urlAvatar),
                    );
                    return ListTile(
                      title: Text(contato.nome),
                      subtitle: Text(contato.telefone),
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

import 'package:flutter_application_1/database/sqlite/connection.dart';
import 'package:flutter_application_1/domain/entity/contact.dart';
import 'package:flutter_application_1/domain/interface/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

class ContactDaoImp implements ContactDao {
  late Database _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('contact');
    List<Contact> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contact(
        id: linha['id'],
        nome: linha['nome'],
        telefone: linha['telefone'],
        urlAvatar: linha['urlAvatar'],
      );
    });

    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    String sql = 'DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    _db = await Connection.get();
    String sql;

    if (contact.id == null) {
      sql = 'INSERT INTO contact (nome,telefone,urlAvatar) VALUES (?,?,?)';
      _db.rawInsert(sql, [contact.nome, contact.telefone, contact.urlAvatar]);
    } else {
      sql =
          'UPDATE contact SET nome = ?,telefone = ?, urlAvatar = ? WHERE id = ?';
      _db.rawUpdate(
          sql, [contact.nome, contact.telefone, contact.urlAvatar, contact.id]);
    }
  }
}

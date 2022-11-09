import 'package:flutter_application_1/domain/entity/contact.dart';

abstract class ContactDao {
  save(Contact contact);

  remove(int id);

  Future<List<Contact>> find();
}

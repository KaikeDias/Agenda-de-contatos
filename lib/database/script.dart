// ignore_for_file: prefer_const_declarations

final createTable = '''
  CREATE TABLE contact(
    id INT PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL 
  )
''';

final insert1 = '''
  INSERT INTO contact (nome,telefone,url_avatar)
  VALUES ('kaike','(89) 9 9448-3506','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVhu2QvPC8n4uidQKrBPKil7Ur6Uf70iOwSVwwepJvBI-d5xNA5WK0HnggdJWg19iKHoI&usqp=CAU')
''';

final insert2 = '''
  INSERT INTO contact (nome,telefone,url_avatar)
  VALUES ('kelsu','(86) 9 8166-0789','http://1.bp.blogspot.com/_Ou6ozlM9QWs/SqeshkDdb_I/AAAAAAAAASs/N8SoG66A5BU/w1200-h630-p-k-no-nu/0XVlSFA9Gp6utoxllAJhcmllo1_250.jpg')
''';

final insert3 = '''
  INSERT INTO contact (nome,telefone,url_avatar)
  VALUES ('kairon','(86) 9 9440-1531','https://i.pinimg.com/736x/da/08/d5/da08d56c6eb2218fbd2da9501ec5c7e0.jpg')
''';

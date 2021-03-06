

DROP TABLE IF EXISTS Фирма;
DROP TABLE IF EXISTS Вакансии;
DROP TABLE IF EXISTS Соискатель;
DROP TABLE IF EXISTS резюме;
DROP TABLE IF EXISTS стаж;
DROP TABLE IF EXISTS профессия; 
DROP TABLE IF EXISTS отрасаль;
DROP TABLE IF EXISTS просмотр;


CREATE TABLE Фирма (
  название varchar(50) NOT NULL,
  Номер_счёта int(11) DEFAULT NULL,
  PRIMARY KEY (Номер_счёта)
) ;
CREATE TABLE Вакансии (
  название профессии varchar(50) REFERENCES профессия(название_профессии),
  нужный стаж varchar(50) NOT NULL,
  ID_вакансии int(11) NOT NULL,
  мин_зп money NOT NULL,
  макс_зп money NOT NULL,
  номер_счёта  int(11) REFERENCES Фирма(Номер_счёта),
  CHECK ( макс_зп > мин_зп),
  PRIMARY KEY (ID_вакансии)
 ) ;
 CREATE TABLE Соискатель (
  ID_соискателя int(11) NOT NULL,
  фио varchar(50) DEFAULT NULL,
  телефон varchar(50) DEFAULT NULL,
  почта varchar(50) DEFAULT NULL,
  PRIMARY KEY (ID_соискателя)
) ;

CREATE TABLE резюме (
  ID_резюме int(11) NOT NULL,
  рейтинг int(11) NOT NULL,
  время_заливаdate  NOT NULL,
  мин_зп money,
  ID_соискателя int(11) REFERENCES Соискатель(ID_соискателя),
  CHECK (рейтинг>0 and рейтинг<6),
  PRIMARY KEY (ID_резюме)
  
) ;

CREATE TABLE стаж (
 ID_резюме int(11) REFERENCES резюме(ID_резюме),
  ID_стаж varchar(50) NOT NULL,
  дата_начала_работы date NOT NULL,
  дата_конца_работы date NOT NULL,
  профессия REFERENCES профессия(название_профессии),
  PRIMARY KEY (ID_стаж)
 ) ;

CREATE TABLE профессия (
  название_профессии varchar(50) NOT NULL,
  отрасаль varchar(50) REFERENCES отрасаль(название),
  PRIMARY KEY (название_профессии)
  ) ;


CREATE TABLE отрасаль(
  название varchar(50) NOT NULL,
   PRIMARY KEY (название)
  ) ;

CREATE TABLE просмотр(
  номер_счёта int(11) REFERENCES Фирма(Номер_счёта),
  ID_резюме int(11) REFERENCES Резюме(ID_резюме),
  сумма money NOT NULL,
  дата date NOT NULL,
  PRIMARY KEY (номер_счёта,ID_резюме)
  ) ;
  
  INSERT INTO отрасаль VALUES ('мемерство');
  INSERT INTO отрасаль VALUES ('окультизм');
  INSERT INTO отрасаль VALUES ('прогейминг');
  INSERT INTO отрасаль VALUES ('руинерство');
  
  INSERT INTO профессия VALUES ('задрот' , 'прогейминг');
  INSERT INTO профессия VALUES ('Агент габэна из скрытого пула','руинерство');
  INSERT INTO профессия VALUES ('любитель лолей' , 'мемерство');
  INSERT INTO профессия VALUES ('рунописец','окультизм');
  
  INSERT INTO Фирма VALUES ('KEKSGRUP' , 11121111);
  INSERT INTO Фирма VALUES ('OOO LOLI v lichke' , 11335522);
  INSERT INTO Фирма VALUES ('OOO DOTAGAMING' , 1133552);
  INSERT INTO Фирма VALUES ('VALVE' , 32232203);
  INSERT INTO Фирма VALUES ('ZAO Ритуальные услуги' , 66600666);
  
  INSERT INTO Соискатель VALUES (1 , 'Эльмонд Эльмодов',88805553535, 'keksk@mai.ru');
  INSERT INTO Соискатель VALUES (2 , 'миша деревянь',888055353535, 'chebureks@mail.ru');
  INSERT INTO Соискатель VALUES (3 , 'Папич НЫААААА',888215553535, 'NyAAAAAA@mai.ru');
  
  INSERT INTO резюме VALUES (1,1,'2018-04-02 00:00:00',300,1);
  INSERT INTO резюме VALUES (2,2,'2018-02-02 00:00:00',322,3);
  INSERT INTO резюме VALUES (3,3,'2018-04-02 00:00:00',1488,2);
  INSERT INTO резюме VALUES (4,4,'2018-02-02 00:00:00',322,1);
  INSERT INTO резюме VALUES (5,2,'2018-11-02 00:00:00',12333,1);
  INSERT INTO резюме VALUES (6,1,'2018-11-02 00:00:00',12333,2);
  
  INSERT INTO Вакансии VALUES ('задрот','21 год',1,43,45,1133552);
  INSERT INTO Вакансии VALUES ('любитель лолей','пикчи лолей',2,22,33,11335522);
  INSERT INTO Вакансии VALUES ('задрот','2к часов',3,22,33,11121111);
  INSERT INTO Вакансии VALUES ('Агент габэна из скрытого пула','0 скила',4,22,33,32232203);
  INSERT INTO Вакансии VALUES ('Агент габэна из скрытого пула','21 к часов',5,22,33,32232203);
  INSERT INTO Вакансии VALUES ('рунописец','читать',6,22,33,66600666);
  
  INSERT INTO стаж VALUES (1,1,'2018-04-02 00:00:00','2018-02-02 00:00:00','мемерство');
  INSERT INTO стаж VALUES (2,2,'2018-03-02 00:00:00','2018-01-02 00:00:00','мемерство');
  INSERT INTO стаж VALUES (3,3,'2018-04-02 00:00:00','2018-03-02 00:00:00','мемерство');
  INSERT INTO стаж VALUES (3,4,'2018-05-02 00:00:00','2018-01-02 00:00:00','прогейминг');
  
  INSERT INTO просмотр VALUES (11335522,1,32,'2018-03-02 00:00:00');
  INSERT INTO просмотр VALUES (11335522,2,23,'2018-03-02 00:00:00');
  

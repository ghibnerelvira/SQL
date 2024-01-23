-- Use DBML to define your database structure
-- Docs: https://dbml.dbdiagram.io/docs

-- https://dbdiagram.io/d/Copy-of-video_hosting_jan_10_2024-65a53c5eac844320aef311e7

-- Таблица Users содержит информацию о зарегистрированных пользователях.
-- Таблица "Пользователи" (Users):
-- UserID (PK): Уникальный идентификатор пользователя.
-- Имя (Name): Имя пользователя.
-- Электронная почта (Email): Адрес электронной почты пользователя.
-- Хэш пароля (PasswordHash): Хэшированный пароль пользователя.
-- Дата регистрации (RegistrationDate): Дата и время регистрации.


-- Таблица Games содержит информацию о шахматных партиях, включая участников и статус игры.
-- Таблица "Игры" (Games):
-- GameID (PK): Уникальный идентификатор игры.
-- Белые (WhiteUserID, FK to Users.UserID): Внешний ключ для определения пользователя, играющего за белых.
-- Черные (BlackUserID, FK to Users.UserID): Внешний ключ для определения пользователя, играющего за черных.
-- Статус (Status): Текущий статус игры (например, "активная", "завершенная").
-- Дата начала (StartDate): Дата и время начала игры.

-- -- Таблица Moves хранит информацию о каждом ходе в партии, включая номер партии, игрока, нотацию хода и время хода.
-- Таблица "Ходы" (Moves):
-- MoveID (PK): Уникальный идентификатор хода.
-- GameID (FK to Games.GameID): Внешний ключ для определения игры, к которой относится ход.
-- Игрок (Player): Указывает, за какого игрока был сделан ход (белые или черные).
-- Нотация хода (MoveNotation): Строка, представляющая нотацию хода в шахматной нотации (например, "e4", "Nf3").
-- Время хода (MoveTime): Время, затраченное на выполнение хода.

-- Таблица Chat: Добавлена для хранения сообщений в чате между игроками. 
-- Связана с таблицей Games для указания, к какой игре относится каждое сообщение.

-- Таблица Ratings: Добавлена для хранения рейтинга игроков. 
-- Связана с таблицей Users для указания рейтинга каждого пользователя.

Table Users {
  UserID int
  UserName varchar(255) 
  Email varchar(255)
  PasswordHash varchar(255)
  RegistrationDate timestamp
}

Table Games {
  GameID int
  WhiteUserID int
  BlackUserID int
  Status varchar(50)
  StartDate timestamp
}

Table Moves {
  MoveID int
  GameID int
  Player varchar(10)
  MoveNotation varchar(10)
  MoveTime timestamp
}

Table Chat {
  MessageID int
  GameID int
  SenderID int
  MessageText text
  SendTime timestamp
}

Table Ratings {
  RatingID int
  UserID int
  UserName int
  EloRating int
}




Ref: "Moves"."GameID" < "Games"."GameID"

Ref: "Users"."UserID" < "Moves"."Player"

Ref: "Ratings"."UserID" < "Users"."UserID"

Ref: "Chat"."GameID" < "Games"."GameID"

Ref: "Chat"."SenderID" < "Users"."UserID"

Ref: "Ratings"."UserName" < "Users"."UserName"
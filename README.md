# README

## Описание и зависимости

![Список пациентов](/screenshots/patients.png "Пациенты")

![Список анализов](/screenshots/analysis.jpg "Анализы")

Веб приложение для мед. учереждений для работы с пациентами и их анализами

Данное приложение написано на языки Ruby с использованием фреймворка Ruby on Rails

Были использованы гемы(библиотеки):

1. device - для авторизации
2. bootstrap - для стилизации интерфейса
3. sqlite3 - база данных
4. puma - для мультипоточного запуска веб приложения


## Установка и зависимости

Для запуска нужно установить Ruby 3.1.2

На системах семейства Windows нужно директорию в которой лежит код, рекурсивно разрешить доступ на чтение к файлам

Установить зависимости

```
bundle install
```
Произвести миграцию и создать базу данных

```
rails db:migrate
```
Сгенерировать учетные записи (список стандартных учетных записей можно глянуть в файле seeds.rb)

```
rails db:seed
```

Теперь можно запускать приложение

```
rails s
```

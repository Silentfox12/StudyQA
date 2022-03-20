﻿#language: ru

@tree
@БыстрыеПроверки

Функционал: Проверка записи Организации

Как Тестировщик я хочу
проверить запись элемента справочники Организации 
чтобы убедиться в возможности настройки организаций

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка записи Организации
	* Открытие элемента справочника Организации
		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
		Тогда открылось окно 'Организации'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Организация (создание)'
	* Заполнение и запись элемента, проверка заполненных полей и закрытие элемента
		И в поле с именем 'Description_ru' я ввожу текст 'Тестовый контрагент'
		И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
		И я нажимаю на кнопку с именем 'FormWrite'
		Тогда элемент формы с именем "Type" стал равен 'Организация'
		Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
		И я нажимаю на кнопку с именем 'FormWriteAndClose'
	* Открытие элемента после записи и проверка значений полей
		И в таблице "List" я перехожу к строке:
			| 'Наименование'        |
			| 'Тестовый контрагент' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Type" стал равен 'Организация'
		Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	* Закрытие всех окон
		И я закрываю все окна клиентского приложения
	
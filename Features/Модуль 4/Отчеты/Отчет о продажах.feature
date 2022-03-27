﻿#language: ru

@tree
@Отчеты

Функционал: Отчет о продажах

Как Руководитель отдела продаж я хочу
сформировать отчета о продажах,
чтобы оценить объём продаж.

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Подготовительный сценарий для отчета о продажах
	// Загрузка документов продажи и возвратов.
	Когда Экспорт основных данных
	Когда Экспорт документов продажи
	// Проведение документов.
	И я выполняю код встроенного языка на сервере
		|'Документы.SalesInvoice.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesInvoice.НайтиПоНомеру("2").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.ShipmentConfirmation.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.ShipmentConfirmation.НайтиПоНомеру("2").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturn.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturn.НайтиПоНомеру("2").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: Проверка отчета о продажах с учетом возвратов
	* Формирование и проверка отчета без детальных записей
		Дано я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
		Тогда открылось окно 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormLoadVariant'
		Тогда открылось окно 'Загрузить форму'
		И я нажимаю на кнопку с именем 'FormLoadSetting'
		Тогда открылось окно 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormGenerate'
		И я жду когда в табличном документе "Result" заполнится ячейка "R2C1" в течение 20 секунд
		Тогда табличный документ "Result" равен макету "Продажи без детальных записей" по шаблону
	* Формирование и проверка отчета с детальными записями
		И я нажимаю на кнопку с именем 'FormChangeVariant'
		Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
		И в таблице "SettingsComposerSettings" я перехожу к строке:
			| 'Использование' | 'Структура отчета'   |
			| 'Нет'           | '<Детальные записи>' |
		И в таблице "SettingsComposerSettings" я изменяю флаг с именем 'SettingsComposerSettingsUse'
		И в таблице "SettingsComposerSettings" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormEndEdit'
		И я нажимаю на кнопку с именем 'FormGenerate'
		И я жду когда в табличном документе "Result" заполнится ячейка "R5C11:R7C14" в течение 20 секунд
		Тогда табличный документ "Result" равен макету "Продажи с детальными записями" по шаблону
										
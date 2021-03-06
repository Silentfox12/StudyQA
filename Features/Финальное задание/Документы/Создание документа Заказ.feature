#language: ru

@Документы
@Заказ
@tree

Функционал: Создание документа Заказ

Как Менеджер по продажам я хочу
создать документ Заказ,
чтобы зафиксировать потребность клиента

Контекст:
	Дано я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""

Сценарий: _4.0601 Подготовительный сценарий (создание документа Заказ)
	Когда Загрузка основных данных
	И я проверяю или создаю для документа "Заказ" объекты:
		| 'Ссылка'                                                         | 'ПометкаУдаления' | 'Номер'     | 'Дата'                | 'Проведен' | 'Покупатель'                                                             | 'Склад'                                                             | 'Валюта'                                                            | 'ВидЦен'                                                             | 'Организация'                                                            | 'СостояниеЗаказа'              | 'Автор' | 'Сумма' |
		| 'e1cib/data/Документ.Заказ?ref=bbef0050ba5c887711e1fc040faf2b19' | 'False'           | '000000008' | '28.05.2020 21:03:12' | 'False'    | 'e1cib/data/Справочник.Контрагенты?ref=8ca0000d8843cd1b11dc8d043d710079' | 'e1cib/data/Справочник.Склады?ref=a9b000055d49b45e11db8b8bdc1aadc2' | 'e1cib/data/Справочник.Валюты?ref=a9b000055d49b45e11db8c4421dda1c5' | 'e1cib/data/Справочник.ВидыЦен?ref=a9b000055d49b45e11db8c4c9d5c4225' | 'e1cib/data/Справочник.Организации?ref=8d34000d8843cd1b11dd2bea12f94c63' | 'Enum.СостоянияЗаказов.Закрыт' | ''      | 9000    |

Сценарий: _4.0602 Проверка недоступности создания заказа менеджером по закупкам
	// Сценарий выполняем под менеджером по закупкам.
	И я подключаю TestClient "Менеджер по закупкам" логин "Менеджер по закупкам" пароль ""
	И я закрываю все окна клиентского приложения
	И я открываю навигационную ссылку "e1cib/list/Документ.Заказ"
	И элемент формы с именем "ФормаСоздать" отсутствует на форме
	И элемент формы с именем "ФормаСкопировать" отсутствует на форме
	И в таблице "Список" я добавляю строку
	И проверяю шаги на Исключение:
		|'Тогда открылось окно "Заказ (создание)"'|
	И я закрываю все окна клиентского приложения
	// Подключаем обратно клиент администратора.
	И я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""	

Сценарий: _4.0603 Проверка видимости заказа менеджеру по закупкам и невозможности его проведения
	// Сценарий выполняем под менеджером по закупкам.
	И я подключаю TestClient "Менеджер по закупкам" логин "Менеджер по закупкам" пароль ""
	И я закрываю все окна клиентского приложения
	И я открываю навигационную ссылку "e1cib/list/Документ.Заказ"
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     |
		| '000000008' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ 000000008 от *'
	И проверяю шаги на Исключение:
		|'И я нажимаю на кнопку с именем "ФормаПровести"'|
	И проверяю шаги на Исключение:
		|'И я нажимаю на кнопку с именем "ФормаЗаписать"'|
	И проверяю шаги на Исключение:
		|'И я нажимаю на кнопку с именем "ФормаПровестиИЗакрыть"'|
	И я закрываю все окна клиентского приложения
	// Подключаем обратно клиент администратора.
	И я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""	

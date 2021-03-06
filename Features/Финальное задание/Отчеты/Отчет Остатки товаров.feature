#language: ru

@Отчеты
@ОтчетОстаткиТоваров
@tree

Функционал: Отчет Остатки товаров

Как Менеджер по закупкам я хочу
сформировать отчет по остаткам товаров,
чтобы спланировать закупки 

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: _2.0201 Отчет Остатки товаров. Основной вариант отчета.
	И я закрываю все окна клиентского приложения
* Загрузка документов движения товаров.
	Когда Загрузка основных данных
	Когда Загрузка документов движения товаров
* Формирование и проверка отчета.
	И я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
	Тогда открылось окно 'Остатки товаров'
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно 'Выбор варианта отчета'
	И в таблице "СписокНастроек" я перехожу к строке:
		| 'Представление' |
		| 'Основной'      |
	И я нажимаю на кнопку с именем 'Загрузить'
	Тогда открылось окно 'Остатки товаров'
	Когда открылось окно 'Остатки товаров'
	И я устанавливаю флаг 'Разворот по складу'
	И я нажимаю на кнопку с именем 'ФормаСформировать'
	И я жду когда в табличном документе "Результат" заполнится ячейка "R1C1:R2C1" в течение 20 секунд
	Тогда табличный документ "Результат" равен макету "Остатки товаров"
	И я закрываю все окна клиентского приложения
	
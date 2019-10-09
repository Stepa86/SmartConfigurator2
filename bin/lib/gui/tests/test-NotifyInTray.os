#Использовать asserts
#Использовать gui


Перем юТест;
Перем Форма;
Перем ТекстПроверки;

Процедура Инициализация()
	
КонецПроцедуры

Функция ПолучитьСписокТестов(Тестирование) Экспорт

	юТест = Тестирование;

	СписокТестов = Новый Массив;
	
	СписокТестов.Добавить("Тест_Должен_ПоказатьУведомлениеВТрееСтандартнаяИконка");
	СписокТестов.Добавить("Тест_Должен_ПоказатьУведомлениеВТрееБезУказанияИконки");
	СписокТестов.Добавить("Тест_Должен_ПоказатьУведомлениеВТрееИконкаИзФайла");

	Возврат СписокТестов;

КонецФункции

Процедура Тест_Должен_ПоказатьУведомлениеВТрееСтандартнаяИконка() Экспорт

	Трей = Новый УведомлениеВТрее();
	Трей.Заголовок = "Стандартная иконка";
	Трей.Текст = "Иконка из ресурсов библиотеки";
	Трей.Таймаут = 15;
	Трей.Показать();

КонецПроцедуры

Процедура Тест_Должен_ПоказатьУведомлениеВТрееБезУказанияИконки() Экспорт

	Трей = Новый УведомлениеВТрее();
	Трей.Заголовок = "Стандартная иконка";
	Трей.Текст = "Иконка из ресурсов библиотеки - при пустом свойстве Иконка";
	Трей.Иконка = "";
	Трей.Таймаут = 15;
	Трей.Показать();

КонецПроцедуры

Процедура Тест_Должен_ПоказатьУведомлениеВТрееИконкаИзФайла() Экспорт

	Трей = Новый УведомлениеВТрее();
	Трей.Заголовок = "Иконка из файла";
	Трей.Текст = "Указан путь к иконке";
	Трей.Иконка = "fixtures/fileroller.ico";
	Трей.Таймаут = 15;
	Трей.Показать();

КонецПроцедуры


//////////////////////////////////////////////////////////////////////////////////////
// Инициализация

Инициализация();

#использовать WinExt

Перем СредаРазработки;
Перем Взаимодействие;
Перем ВыборИзСписка;

#Область ПрограммныйИнтерфейс

Процедура ОткрытьФайлИзБиблиотеки() Экспорт
	
	РаботаСОкнами = Новый РаботаСОкнами();
	РаботаСОкнами.ЗапомнитьТекущееОкно();
	
	Файл = Новый Файл("settings\СписокКаталоговВнешнихФорм.os");
	Если НЕ Файл.Существует() Тогда

		ТекстСообщения = "Невозможно выбрать файл для открытия. "
			+ "Нет файла с настройками внешними файлами. "
			+ "Необходимо указать пути внешних отчетов/обработок: settings/СписокКаталоговВнешнихФорм.os";

		Взаимодействие.Предупреждение(ТекстСообщения);
		Возврат;

	КонецЕсли;
	

	Настройки = ЗагрузитьСценарий("settings\СписокКаталоговВнешнихФорм.os").Настройки;
	
	Если Настройки.Количество() = 0 Тогда
		
		ТекстСообщения = "Невозможно выбрать файл для открытия. "
			+ "Нет путей с внешними файлами. "
			+ "Необходимо указать пути внешних отчетов/обработок: settings/СписокКаталоговВнешнихФорм.os";
		
		Взаимодействие.Предупреждение(ТекстСообщения, "Внешние файлы");
		Возврат;
		
	КонецЕсли;
	
	СписокФайлов = Новый Соответствие;
	
	Для каждого Путь Из Настройки Цикл
		ПолучитьСписокФайлов(Путь, СписокФайлов);
	КонецЦикла;
	
	Результат = ВыборИзСписка.ВыбратьИзСписка(СписокФайлов, Истина);
	Если Результат = Неопределено Тогда
		
		Возврат;
		
	КонецЕсли;
	
	РаботаСОкнами.АктивироватьЗапомненноеОкно();
	
	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьCtrlO();
	
	Если НЕ СредаРазработки.НайденоОкноСЗаголовком("Открыт") Тогда

		Возврат;

	КонецЕсли;
	
	СредаРазработки.УстановитьТекстВВыделение(Результат);
	МСПослатьКлавиши.ПослатьКлавиши("{Enter}");

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПолучитьСписокФайлов(Знач РабочийКаталог, СписокФайлов)
	
	МассивДопустимыхРасширений = Новый Массив;
	МассивДопустимыхРасширений.Добавить(".epf");
	МассивДопустимыхРасширений.Добавить(".erf");
	МассивДопустимыхРасширений.Добавить(".cf");
	
	Каталоги = НайтиФайлы(РабочийКаталог, "*.*", Истина);
	Для Каждого НайденныйФайл Из Каталоги Цикл
		Если МассивДопустимыхРасширений.Найти(НайденныйФайл.Расширение) <> Неопределено Тогда
			СписокФайлов.Вставить(НайденныйФайл.ПолноеИмя, НайденныйФайл.ПолноеИмя);
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

Процедура ПриСозданииОбъекта()
	
	СредаРазработки = ЗагрузитьСценарий("core\СредаРазработки.os");
	Взаимодействие = ЗагрузитьСценарий("core\Взаимодействие.os");
	ВыборИзСписка = ЗагрузитьСценарий("core\SelectValue.os");
	
КонецПроцедуры
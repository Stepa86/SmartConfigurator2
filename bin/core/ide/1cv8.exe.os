#Использовать WinExt
#Использовать extensions

#Область ПрограммныйИнтерфейс

Процедура ОбработатьВыборШаблона() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьCtrlQ();

КонецПроцедуры

Процедура ПерейтиПоОператорнымСкобкамНазад() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКвадратнуюСкобкуЛевую();

КонецПроцедуры

Процедура ПерейтиВНачалоСтроки() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("{HOME}");

КонецПроцедуры

Процедура ПерейтиВКонецСтроки() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("{END}");

КонецПроцедуры

Процедура ПерейтиНаНовуюСтроку() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("{ENTER}");

КонецПроцедуры

Процедура СдвинутьКурсорВправо() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("{RIGHT}");

КонецПроцедуры

Процедура СдвинутьКурсорВлево() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("{LEFT}");

КонецПроцедуры

Процедура ПерейтиКСтрокеПоНомеру(НомерСтроки) Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьCtrlG();

	Если НЕ НайденоОкноСЗаголовком("Перейти по номеру строки") Тогда
		Возврат;
	КонецЕсли;

	МСПослатьКлавиши.ПослатьКлавиши(НомерСтроки);
	МСПослатьКлавиши.ПослатьКлавиши("{Enter}");
	МСПослатьКлавиши.ПослатьКлавиши("{Left}");

КонецПроцедуры

Процедура ПерейтиИВыделитьСтрокуПоНомеру(Знач НомерСтроки) Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьCtrlG();

	Если НЕ НайденоОкноСЗаголовком("Перейти по номеру строки") Тогда
		Возврат;
	КонецЕсли;

	МСПослатьКлавиши.ПослатьКлавиши(НомерСтроки);
	МСПослатьКлавиши.ПослатьКлавиши("{Enter}");

КонецПроцедуры

Функция НайденоОкноСЗаголовком(ИскомоеЗначение, КолСекОжидания = 5) Экспорт

	РаботаСОкнами = Новый РаботаСОкнами();

	КолРазЖдать = КолСекОжидания * 10;
	КолЖдем = 0;
	Пока РаботаСОкнами.АктивироватьОкноПоЗаголовку(ИскомоеЗначение) <> Истина Цикл
		Приостановить(100);
		КолЖдем  = КолЖдем  + 1;
		
		Если КолЖдем >= КолРазЖдать Тогда
			Возврат Ложь;
		КонецЕсли;
		
	КонецЦикла;

	Возврат Истина;
	
КонецФункции

Функция ТекстВышеКурсора() Экспорт
	
	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("^+{Home}^{INS}");
	МСПослатьКлавиши.ПослатьКлавиши("{Right}");
	
	Возврат ПолучитьТекстИзБуфераОбмена();

КонецФункции

Функция ПолучитьВыделенныйТекст() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("^{INS}");

	Приостановить(200);

	Возврат ПолучитьТекстИзБуфераОбмена();

КонецФункции

Функция ПолучитьТекстИзБуфераОбмена() Экспорт

	Попытка
		Буфер = Новый БуферОбмена();
		Возврат Буфер.Получить();	
	Исключение
		Сообщить("Ошибка получения текста из буфера обмена");
		Сообщить(ОписаниеОшибки());
		Возврат "";
	КонецПопытки;

КонецФункции

Процедура УстановитьТекстВБуферОбмена(НовыйТекст = "") Экспорт
	
	Попытка
		Буфер = Новый БуферОбмена();
		Буфер.Установить(НовыйТекст);
	Исключение
		Сообщить("Ошибка установки текста в буфер обмена");
		Сообщить(ОписаниеОшибки());
		ВызватьИсключение;
	КонецПопытки;

КонецПроцедуры

Процедура ПоместитьВБуферТекстТекущейСтроки() Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("{HOME}");
	МСПослатьКлавиши.ПослатьКлавиши("^{INS}");

КонецПроцедуры

Функция ПолучитьУказанноеКоличествоСтрокВышеКурсора(КоличествоСтрок) Экспорт

	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	КомандыПодтянияВверх = "";
	Для А = 1 По КоличествоСтрок Цикл
		КомандыПодтянияВверх = КомандыПодтянияВверх + "{UP}";
	КонецЦикла;
	МСПослатьКлавиши.ПослатьКлавиши("+(" + КомандыПодтянияВверх + ")");
	МСПослатьКлавиши.ПослатьКлавиши("^{INS}");
	МСПослатьКлавиши.ПослатьКлавиши("{RIGHT}");
	
	Возврат ПолучитьТекстИзБуфераОбмена();

КонецФункции

Функция ТекстМодуля() Экспорт
	
	РаботаСТекстом = Новый РаботаСТекстом();
	Возврат РаботаСТекстом.ПолучитьТекстПоля();

КонецФункции

Процедура УстановитьТекстВВыделение(НовыйТекст) Экспорт

	УстановитьТекстВБуферОбмена(НовыйТекст);
	
	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("+{INS}");
	
КонецПроцедуры

// Форматировать текст средствами конфигуратора
Процедура ФорматироватьВыделенныйТекст() Экспорт
	
	МСПослатьКлавиши = Новый МСПослатьКлавиши;
	МСПослатьКлавиши.ПослатьКлавиши("+%(F)");

КонецПроцедуры

#КонецОбласти

Процедура ПриСозданииОбъекта()
	
	Интерфейсы = ЗагрузитьСценарий("core\interfaces.os");

	Интерфейсы.Реализован(ЭтотОбъект, "core\interfaces\IDE");

КонецПроцедуры

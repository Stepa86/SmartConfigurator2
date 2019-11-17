#Область РаботаСТекстовымиФайлами

Функция ПолучитьТекстИзФайла(ИмяФайла) Экспорт

	ФайлОбмена = Новый Файл(ИмяФайла);
	Данные = "";
	Если ФайлОбмена.Существует() Тогда

		Текст = Новый ЧтениеТекста(ИмяФайла, КодировкаТекста.UTF8);
		Данные = Текст.Прочитать();
		Текст.Закрыть();

		ОсвободитьОбъект(Текст);
		
	КонецЕсли;

	Возврат Данные;

КонецФункции

Процедура ЗаписатьРезультатВФайл(ИмяФайла, Данные) Экспорт

	Текст = Новый ЗаписьТекста(ИмяФайла, КодировкаТекста.UTF8); 
	Текст.Записать(Данные); 
	Текст.Закрыть();		
	
	ОсвободитьОбъект(Текст);

КонецПроцедуры

#КонецОбласти

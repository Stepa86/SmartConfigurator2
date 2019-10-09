#Использовать gui

Перем МодельХоткея;

Перем УправляемыйИнтерфейс;
Перем ЭтаФорма;

Перем Сохранить Экспорт;

Перем УИД Экспорт;
Перем ПолеКлавиша Экспорт;
Перем ПолеДействие Экспорт;
Перем ФлагCtrl Экспорт;
Перем ФлагAlt Экспорт;
Перем ФлагShift Экспорт;
Перем ФлагWin Экспорт;
Перем ПолеПриложения Экспорт;
Перем ПолеКомментарий Экспорт;

Процедура ПриСозданииОбъекта()

	Сохранить = Ложь;
	
	МодельХоткея = ЗагрузитьСценарий("core/models/Hotkey.os");

	УправляемыйИнтерфейс = Новый УправляемыйИнтерфейс();
	СоздатьЭлементыФормы();
	
КонецПроцедуры

#Область ОбработкаКоманд

Процедура ПриНажатииКнопкаВыбратьДействие() Экспорт
	
	Попытка
		
		СкриптФормыДерева = ЗагрузитьСценарий("core/forms/FormListScripts.os");
		ФормаВыборИзДерева = СкриптФормыДерева.Получить();
		СкриптФормыДерева.РезультатВыбора = ПолеДействие.Значение;
		ФормаВыборИзДерева.Показать();
		
		ПолеДействие.Значение = СкриптФормыДерева.РезультатВыбора;
		
	Исключение
		
		УправляемыйИнтерфейс.СтандартныеДиалоги.Предупреждение(ОписаниеОшибки());
		
	КонецПопытки;
	
КонецПроцедуры

Процедура ПриНажатииКнопкаОкФормаХоткея() Экспорт

	Сохранить = Истина;
	ЭтаФорма.Закрыть();

КонецПроцедуры

Процедура ПриНажатииКнопкаОтмена() Экспорт

	Сохранить = Ложь;
	ЭтаФорма.Закрыть();

КонецПроцедуры

#КонецОбласти

Процедура УстановитьДанныеФормы(Данные) Экспорт

	ДанныеПоСтруктуреХоткея = МодельХоткея.СтруктураЗаписи();
	ЗаполнитьЗначенияСвойств(ДанныеПоСтруктуреХоткея, Данные);

	УИД = ДанныеПоСтруктуреХоткея.Id;
	ФлагCtrl.Значение = ДанныеПоСтруктуреХоткея.Ctrl;
	ФлагAlt.Значение = ДанныеПоСтруктуреХоткея.Alt;
	ФлагShift.Значение = ДанныеПоСтруктуреХоткея.Shift;
	ФлагWin.Значение = ДанныеПоСтруктуреХоткея.Win;
	ПолеКлавиша.Значение = ДанныеПоСтруктуреХоткея.Key;
	ПолеДействие.Значение = ДанныеПоСтруктуреХоткея.Command;
	ПолеПриложения.Значение = ДанныеПоСтруктуреХоткея.App;
	ПолеКомментарий.Значение = ДанныеПоСтруктуреХоткея.Comment;
	
КонецПроцедуры

Процедура СоздатьЭлементыФормы()
	
	ЭтаФорма = УправляемыйИнтерфейс.СоздатьФорму();
	
	ЭтаФорма.Ширина = 600;
	
	ЭлементыФормы = ЭтаФорма.Элементы;
	ВидыПоляФормы = ЭтаФорма.ВидПоляФормы;
	ВидГруппыФормы = ЭтаФорма.ВидГруппыФормы;
	ПоложениеЗаголовка = ЭтаФорма.ПоложениеЗаголовка;
	
	// #Область ГруппаВыборДействия
	
	ГруппаВыборДействия = ЭлементыФормы.Добавить("ГруппаВыборДействия", "ГруппаФормы", Неопределено);
	ГруппаВыборДействия.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаВыборДействия.Заголовок = "Действие";
	ГруппаВыборДействия.Высота = 45;
	
	ПолеДействие = ЭлементыФормы.Добавить("ПолеДействие", "ПолеФормы", ГруппаВыборДействия);
	ПолеДействие.Заголовок = "Выполняемое действие:";
	ПолеДействие.Вид = ВидыПоляФормы.ПолеВвода;
	ПолеДействие.Значение = "";
	ПолеДействие.ТолькоПросмотр = Истина;
	ПолеДействие.Закрепление = УправляемыйИнтерфейс.СтильЗакрепления.Заполнение;
	// ПолеДействие.ПоложениеЗаголовка = ПоложениеЗаголовка.Право;
	
	КнопкаВыбратьДействие = ЭлементыФормы.Добавить("КнопкаВыбратьДействие", "КнопкаФормы", ГруппаВыборДействия);
	// КнопкаВыбратьДействие.Ширина = 21;
	КнопкаВыбратьДействие.Заголовок = "Выбрать ...";
	КнопкаВыбратьДействие.Закрепление = УправляемыйИнтерфейс.СтильЗакрепления.Право;
	КнопкаВыбратьДействие.КнопкаНажатие(ЭтотОбъект, "ПриНажатииКнопкаВыбратьДействие");
	
	// #КонецОбласти
	
	ФлагCtrl = ЭлементыФормы.Добавить("ФлагCtrl", "ПолеФормы", Неопределено);
	ФлагCtrl.Заголовок = "Ctrl";
	ФлагCtrl.Вид = ВидыПоляФормы.ПолеФлажка;
	ФлагCtrl.ПоложениеЗаголовка = ПоложениеЗаголовка.Право;
	
	ФлагAlt = ЭлементыФормы.Добавить("ФлагAlt", "ПолеФормы", Неопределено);
	ФлагAlt.Заголовок = "Alt";
	ФлагAlt.Вид = ВидыПоляФормы.ПолеФлажка;
	ФлагAlt.ПоложениеЗаголовка = ПоложениеЗаголовка.Право;
	
	ФлагShift = ЭлементыФормы.Добавить("ФлагShift", "ПолеФормы", Неопределено);
	ФлагShift.Заголовок = "Shift";
	ФлагShift.Вид = ВидыПоляФормы.ПолеФлажка;
	ФлагShift.ПоложениеЗаголовка = ПоложениеЗаголовка.Право;
	
	ФлагWin = ЭлементыФормы.Добавить("ФлагWin", "ПолеФормы", Неопределено);
	ФлагWin.Заголовок = "Win";
	ФлагWin.Вид = ВидыПоляФормы.ПолеФлажка;
	ФлагWin.ПоложениеЗаголовка = ПоложениеЗаголовка.Право;
	
	ПолеКлавиша = ЭлементыФормы.Добавить("ПолеКлавиша", "ПолеФормы", Неопределено);
	ПолеКлавиша.Вид = ВидыПоляФормы.ПолеСоСписком;
	ПолеКлавиша.СписокВыбора = Клавиши();
	ПолеКлавиша.Заголовок = "Клавиша";
	
	ПолеКомментарий = ЭлементыФормы.Добавить("ПолеКомментарий", "ПолеФормы", Неопределено);
	ПолеКомментарий.Заголовок = "Комментарий:";
	ПолеКомментарий.Вид = ВидыПоляФормы.ПолеВвода;

	ПолеПриложения = ЭлементыФормы.Добавить("ПолеПриложения", "ПолеФормы", Неопределено);
	ПолеПриложения.Заголовок = "Приложения:";
	ПолеПриложения.Вид = ВидыПоляФормы.ПолеВвода;

	КнопкаОтмена = ЭлементыФормы.Добавить("КнопкаОтмена", "КнопкаФормы", Неопределено);
	КнопкаОтмена.Заголовок = "Отмена";
	КнопкаОтмена.Закрепление = УправляемыйИнтерфейс.СтильЗакрепления.Право;
	КнопкаОтмена.КнопкаНажатие(ЭтотОбъект, "ПриНажатииКнопкаОтмена");
	
	КнопкаОк = ЭлементыФормы.Добавить("КнопкаОк", "КнопкаФормы", Неопределено);
	КнопкаОк.Заголовок = "Ок";
	КнопкаОк.Закрепление = УправляемыйИнтерфейс.СтильЗакрепления.Право;
	КнопкаОк.КнопкаНажатие(ЭтотОбъект, "ПриНажатииКнопкаОкФормаХоткея");
	
КонецПроцедуры

Функция Клавиши()
	
	Данные = Новый Соответствие;
	
	Данные.Вставить("D0", "0");
	Данные.Вставить("D1", "1");
	Данные.Вставить("D2", "2");
	Данные.Вставить("D3", "3");
	Данные.Вставить("D4", "4");
	Данные.Вставить("D5", "5");
	Данные.Вставить("D6", "6");
	Данные.Вставить("D7", "7");
	Данные.Вставить("D8", "8");
	Данные.Вставить("D9", "9");
	Данные.Вставить("Q", "Q");
	Данные.Вставить("W", "W");
	Данные.Вставить("E", "E");
	Данные.Вставить("R", "R");
	Данные.Вставить("T", "T");
	Данные.Вставить("Y", "Y");
	Данные.Вставить("U", "U");
	Данные.Вставить("I", "I");
	Данные.Вставить("O", "O");
	Данные.Вставить("P", "p");
	Данные.Вставить("OemOpenBrackets", "[");
	Данные.Вставить("OemCloseBrackets", "]");
	// Данные.Вставить("OemPipe", "\");
	Данные.Вставить("A", "A");
	Данные.Вставить("S", "S");
	Данные.Вставить("D", "D");
	Данные.Вставить("F", "F");
	Данные.Вставить("G", "G");
	Данные.Вставить("H", "H");
	Данные.Вставить("J", "J");
	Данные.Вставить("K", "K");
	Данные.Вставить("L", "L");
	Данные.Вставить("OemSemicolon", ":");
	Данные.Вставить("Z", "Z");
	Данные.Вставить("X", "X");
	Данные.Вставить("C", "C");
	Данные.Вставить("V", "V");
	Данные.Вставить("B", "B");
	Данные.Вставить("N", "N");
	Данные.Вставить("M", "M");
	Данные.Вставить("Oemcomma", "<");
	Данные.Вставить("OemPeriod", ">");
	// Данные.Вставить("OemBackslash", "/");
	Данные.Вставить("F1", "F1");
	Данные.Вставить("F2", "F2");
	Данные.Вставить("F3", "F3");
	Данные.Вставить("F4", "F4");
	Данные.Вставить("F5", "F5");
	Данные.Вставить("F6", "F6");
	Данные.Вставить("F7", "F7");
	Данные.Вставить("F8", "F8");
	Данные.Вставить("F9", "F9");
	Данные.Вставить("F10", "F10");
	Данные.Вставить("F11", "F11");
	Данные.Вставить("F12", "F12");
	
	Данные.Вставить("Left", "LEFT");
	Данные.Вставить("Right", "RIGHT");
	Данные.Вставить("Up", "UP");
	Данные.Вставить("Down", "DOWN");
	
	Данные.Вставить("Enter", "ENTER");
	Данные.Вставить("Escape", "ESC");

	Данные.Вставить("Oemplus", "Plus");
	Данные.Вставить("OemQuestion", "?");
	
	Возврат Данные;
	
КонецФункции

Функция ПолучитьФорму() Экспорт

	Возврат ЭтаФорма;
	
КонецФункции


-- This module will transliterate Udmurt language text per WT:UDM TR.

local export = {}
 
local mapping = {
	["А"]="A", ["Б"]="B", ["В"]="V", ["Г"]="G", ["Д"]="D", ["Е"]="E", ["Ё"]="Jo", ["Ж"]="Ž", ["Ӝ"]="Dž", ["З"]="Z", ["Ӟ"]="Dź", ["И"]="I",
	["Ӥ"]="Ï", ["Й"]="J", ["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["О"]="O", ["Ӧ"]="Ö", ["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T",
	["У"]="U", ["Ф"]="F", ["Х"]="X", ["Ц"]="C", ["Ч"]="Ć", ["Ӵ"]="Č", ["Ш"]="Š", ["Щ"]="Šč", ["Ъ"]="ʺ", ["Ы"]="Y", ["Ь"]="ʹ", ["Э"]="E",
	["Ю"]="Ju", ["Я"]="Ja",
	['а']='a', ['б']='b', ['в']='v', ['г']='g', ['д']='d', ['е']='e', ['ё']='jo', ['ж']='ž', ['ӝ']='dž', ['з']='z', ['ӟ']='dź', ['и']='i',
	['ӥ']='ï', ['й']='j', ['к']='k', ['л']='l', ['м']='m', ['н']='n', ['о']='o', ['ӧ']='ö', ['п']='p', ['р']='r', ['с']='s', ['т']='t',
	['у']='u', ['ў']='w', ['ф']='f', ['х']='x', ['ц']='c', ['ч']='ć', ['ӵ']='č', ['ш']='š', ['щ']='šč', ['ъ']='ʺ', ['ы']='y', ['ь']='ʹ', ['э']='e',
	['ю']='ju', ['я']='ja',
}
 
function export.tr(text, lang, sc)
	-- Ё needs converting if is decomposed
	text = text:gsub("ё","ё"):gsub("Ё","Ё")
	
	-- е after a vowel or at the beginning of a word becomes je
	text = mw.ustring.gsub(text, "([АОӦУЫЕЯЁЮИӤЕЪЬаоӧуыэяёюиӥеъь%A][́̀]?)е","%1je")
	text = mw.ustring.gsub(text, "^Е","Je")
	text = mw.ustring.gsub(text, "^е","je")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е","%1Je")
	text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е","%1je")
	
	return (mw.ustring.gsub(text, '.', mapping))
end
 
return export
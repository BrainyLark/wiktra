-- This module will transliterate Lezgi language text per WT:LEZ TR.
local export = {}

local tt = {
	["б"]="b", ["п"]="p", ["ф"]="f", ["в"]="v", ["м"]="m",
	["д"]="d", ["т"]="t", ["й"]="j", ["н"]="n", ["з"]="z", ["ц"]="c",
	["с"]="s", ["ж"]="ž", ["ш"]="š", ["щ"]="šč", 
	["л"]="l", ["ч"]="č", ["р"]="r", ["г"]="g", ["к"]="k", ["х"]="χ", 
	["ъ"]="ʾ", ["а"]="a", ["е"]="e", ["ы"]="y", ["и"]="i", ["о"]="o", ["у"]="u", 
	["ё"]="ë", ["ь"]="’", ["э"]="è", ["ю"]="ju", ["я"]="ä",
	["Б"]="B", ["П"]="P", ["Ф"]="F", ["В"]="V", ["М"]="M",
	["Д"]="D", ["Т"]="T", ["Й"]="J", ["Н"]="N", ["З"]="Z", ["Ц"]="C",
	["С"]="S", ["Ж"]="Ž", ["Ш"]="Š", ["Щ"]="Šč", 
	["Л"]="L", ["Ч"]="Č", ["Р"]="R", ["Г"]="G", ["К"]="K", ["Х"]="Χ", 
	["Ъ"]="ʾ", ["А"]="A", ["Е"]="E", ["Ы"]="Y", ["И"]="I", ["О"]="O", ["У"]="U", 
	["Ё"]="Ë", ["Ь"]="’", ["Э"]="È", ["Ю"]="Ju", ["Я"]="Ä"};

local trigraphs = {
	['хъв'] = 'q°',
	['Хъв'] = 'Q°',
	['къв'] = 'q̄°',
	['Къв'] = 'Q̄°',
	['кьв'] = 'q̇°',
	['Кьв'] = 'Q̇°',
	['гъв'] = 'ġ°',
	['Гъв'] = 'Ġ°',
	['ттв'] = 't̄°',
	['Ттв'] = 't̄°',
	['ццв'] = 'c̄°',
	['Ццв'] = 'C̄°',
	['ккв'] = 'k̄°',
	['Ккв'] = 'K̄°',
	['тӏв'] = 'ṭ°',
	['Тӏв'] = 'Ṭ°',
	['цӏв'] = 'c̣°',
	['Цӏв'] = 'C̣°',
	['кӏв'] = 'ḳ°',
	['Кӏв'] = 'Ḳ°',
}

local digraphs = {
	['тв'] = 't°',
	['Тв'] = 'T°',
	['зв'] = 'z°',
	['Зв'] = 'Z°',
	['хв'] = 'χ°',
	['Хв'] = 'Χ°',
	['цв'] = 'c°',
	['Цв'] = 'C°',
	['св'] = 's°',
	['Св'] = 'S°',
	['пп'] = 'p̄',
	['пӏ'] = 'ṗ',
	['тт'] = 't̄', 
	['Пп'] = 'P̄',
	['Пӏ'] = 'Ṗ',
	['Тт'] = 'T̄',
	['цӏ'] = 'c̣',
	['цц'] = 'c̄',
	['тӏ'] = 'ṭ',
	['чч'] = 'č̄',
	['чӏ'] = 'č̣',
	['кь'] = 'q̇',
	['кк'] = 'k̄',
	['кӏ'] = 'ḳ',
	['хъ'] = 'q',
	['къ'] = 'q̄',
	['гъ'] = 'ġ',
	['гь'] = 'h',
	['Цӏ'] = 'C̣',
	['Цц'] = 'C̄',
	['Тӏ'] = 'Ṭ',
	['Чч'] = 'Č̄',
	['Чӏ'] = 'Č̣',
	['Кь'] = 'Q̇',
	['Кк'] = 'K̄',
	['Кӏ'] = 'Ḳ',
	['Хъ'] = 'Q',
	['Къ'] = 'Q̄',
	['Гъ'] = 'Ġ',
	['Гь'] = 'H',
	['уь'] = 'ü',
	['Уь'] = 'Ü',
	['хь'] = 'x',
	['Хь'] = 'X',
	['гв'] = 'g°',
	['Гв'] = 'G°',
	['кв'] = 'k°',
	['Кв'] = 'K°',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	local UTF8_char = '[%z\1-\127\194-\244][\128-\191]*'
	
	-- Convert capital to lowercase palochka. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	for digraph, replacement in pairs(digraphs) do
		text = str_gsub(text, digraph, replacement)
	end
	
	for trigraph, replacement in pairs(trigraphs) do
		text = str_gsub(text, trigraph, replacement)
	end
	
	text = str_gsub(text, UTF8_char, tt)
	
	return text
end

return export
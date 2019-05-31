-- This module will transliterate Avar language text per WT:AV TR. 
-- Language code is ava and oav.

local export = {}

local tt = {
	["б"]="b", ["п"]="p", ["ф"]="f", ["в"]="w", ["м"]="m",
	["д"]="d", ["т"]="t", ["й"]="j", ["н"]="n", ["з"]="z", ["ц"]="c",
	["с"]="s", ["ж"]="ž", ["ш"]="š", ["щ"]="š̄", 
	["л"]="l", ["ч"]="č", ["р"]="r", ["г"]="g", ["к"]="k", ["х"]="χ", 
	["ъ"]="ʾ", ["а"]="a", ["е"]="e", ["ы"]="ə", ["и"]="i", ["о"]="o", ["у"]="u", 
	["ё"]="ë", ["ь"]="’", ["э"]="è", ["ю"]="ju", ["я"]="ja",
	["Б"]="B", ["П"]="P", ["Ф"]="F", ["В"]="W", ["М"]="M",
	["Д"]="D", ["Т"]="T", ["Й"]="J", ["Н"]="N", ["З"]="Z", ["Ц"]="C",
	["С"]="S", ["Ж"]="Ž", ["Ш"]="Š", ["Щ"]="Š̄", 
	["Л"]="L", ["Ч"]="Č", ["Р"]="R", ["Г"]="G", ["К"]="K", ["Х"]="Χ", 
	["Ъ"]="ʾ", ["А"]="A", ["Е"]="E", ["Ы"]="Ə", ["И"]="I", ["О"]="O", ["У"]="U", 
	["Ё"]="Ë", ["Ь"]="’", ["Э"]="È", ["Ю"]="Ju", ["Я"]="Ja"};

local tetragraphs = {
	['цӏцӏ'] = 'c̣̄',
	['чӏчӏ'] = 'č̣̄',
	['кӏкӏ'] = 'ḳ̄',
	['лълъ'] = 'ł̄',
	['Цӏцӏ'] = 'C̣̄',
	['Чӏчӏ'] = 'Č̣̄',
	['Кӏкӏ'] = 'Ḳ̄',
	['Лълъ'] = 'Ł̄',
}

local digraphs = {
	['цӏ'] = 'c̣',
	['цц'] = 'c̄',
	['тӏ'] = 'ṭ',
	['лӏ'] = 'kl',
	['сс'] = 's̄',
	['лъ'] = 'ł',
	['чч'] = 'č̄',
	['чӏ'] = 'č̣',
	['кь'] = 'kḷ',
	['кк'] = 'k̄',
	['кӏ'] = 'ḳ',
	['хь'] = 'x',
	['хъ'] = 'q̄',
	['къ'] = 'q̇̄',
	['гъ'] = 'ġ',
	['хх'] = 'χ̄',
	['гӏ'] = 'ʿ',
	['хӏ'] = 'ḥ',
	['гь'] = 'h',
	['Цӏ'] = 'C̣',
	['Цц'] = 'C̄',
	['Тӏ'] = 'Ṭ',
	['Лӏ'] = 'Kl',
	['Сс'] = 'S̄',
	['Лъ'] = 'Ł',
	['Чч'] = 'Č̄',
	['Чӏ'] = 'Č̣',
	['Кь'] = 'Kḷ',
	['Кк'] = 'K̄',
	['Кӏ'] = 'Ḳ',
	['Хь'] = 'X',
	['Хъ'] = 'Q̄',
	['Къ'] = 'Q̇̄',
	['Гъ'] = 'Ġ',
	['Хх'] = 'Χ̄',
	['Гӏ'] = 'ʿ',
	['Хӏ'] = 'Ḥ',
	['Гь'] = 'H',
}

function export.tr(text, lang, sc)
	local str_gsub = string.gsub
	
	-- Convert uppercase palochka to lowercase. Lowercase is found in tables
	-- above.
	text = str_gsub(text, mw.ustring.char(0x4C0), mw.ustring.char(0x4CF))
	
	for grapheme, replacement in pairs(tetragraphs) do
		text = str_gsub(text, grapheme, replacement)
	end
	
	for grapheme, replacement in pairs(digraphs) do
		text = str_gsub(text, grapheme, replacement)
	end
	
	text = str_gsub(text, '[\1-\127\194-\244][\128-\191]*', tt)
	
	return text
end

return export
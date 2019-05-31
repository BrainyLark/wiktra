-- This module is used to transliterate text in the Old Cyrillic and Glagolitic alphabets. 
-- It is used to transliterate Old Church Slavonic (cu), Old East Slavic (orv) and Old Novgorodian (zle-ono).

-- Language code: chu

--[[The language code is necessary because some letters are transliterated slightly differently depending 
on the language. The script code selects between Cyrillic and Glagolitic transliteration.]]

local export = {}

local letters = {}
local digraphs = {}

local double_grave = mw.ustring.char(0x30F)

letters["Cyrs"] = {
	["А"]='A', ["а"]='a',
	["Б"]='B', ["б"]='b',
	["В"]='V', ["в"]='v',
	["Г"]='G', ["г"]='g', 
	["Д"]='D', ["д"]='d',
	["Е"]='E', ["е"]='e', ["Є"]='E', ["є"]='e', 
	["Ж"]='Ž', ["ж"]='ž',
	["Ѕ"]='Dz', ["ѕ"]='dz', ["Ꙃ"]='Dz', ["ꙃ"]='dz',
	["З"]='Z', ["з"]='z', ["Ꙁ"]='Z', ["ꙁ"]='z',
	["И"]='I', ["и"]='i', ["І"]='I', ["і"]='i', ["Ї"]='I', ["ї"]='i',
	["Ꙉ"]='Đ', ["ꙉ"]='đ',
	["К"]='K', ["к"]='k',
	["Л"]='L', ["л"]='l', 
	["М"]='M', ["м"]='m',
	["Н"]='N', ["н"]='n',
	["О"]='O', ["о"]='o', ["Ѡ"]='O', ["ѡ"]='o', ["Ѿ"]='Otŭ', ["ѿ"]='otŭ', ["Ꙩ"]='O', ["ꙩ"]='o', ["Ꙫ"]='O', ["ꙫ"]='o', ["Ꙭ"]='O', ["ꙭ"]='o', ["ꙮ"]='o', 
	["П"]='P', ["п"]='p', 
	["Р"]='R', ["р"]='r',
	["С"]='S', ["с"]='s',
	["Т"]='T', ["т"]='t',
	["Ѹ"]='U', ["ѹ"]='u', ["Ꙋ"]='U', ["ꙋ"]='u', ["У"]='U', ["у"]='u',
	["Ф"]='F', ["ф"]='f',
	["Х"]='X', ["х"]='x',
	
	["Ц"]='C', ["ц"]='c',
	["Ч"]='Č', ["ч"]='č', 
	["Ш"]='Š', ["ш"]='š',
	-- For Щ see below
	["Ъ"]='Ŭ', ["ъ"]='ŭ',
	["Ꙑ"]='Y', ["ꙑ"]='y', ["Ы"]='Y', ["ы"]='y',
	["Ь"]='Ĭ', ["ь"]='ĭ',
	["Ѣ"]='Ě', ["ѣ"]='ě',
	
	["Ю"]='Ju', ["ю"]='ju', 
	["Ꙗ"]='Ja', ["ꙗ"]='ja', ["Я"]='Ja', ["я"]='ja',
	["Ѥ"]='Je', ["ѥ"]='je',
	["Ѧ"]='Ę', ["ѧ"]='ę',
	["Ѩ"]='Ję', ["ѩ"]='ję',
	["Ѫ"]='Ǫ', ["ѫ"]='ǫ',
	["Ѭ"]='Jǫ', ["ѭ"]='jǫ',
	["Ꙓ"]='Jě', ["ꙓ"]='jě',
	
	["Ѯ"]='Ks', ["ѯ"]='ks',
	["Ѱ"]='Ps', ["ѱ"]='ps',
	["Ѳ"]='Θ', ["ѳ"]='θ',
	["Ѵ"]='Ü', ["ѵ"]='ü', ["Ѷ"]='Ü' .. double_grave, ["ѷ"]='ü' .. double_grave,
}

digraphs["Cyrs"] = {
	["О[Уу]"]="U", ["оу"]="u",
}

letters["Glag"] = {
	["Ⰰ"]='A', ["ⰰ"]='a',
	["Ⰱ"]='B', ["ⰱ"]='b',
	["Ⰲ"]='V', ["ⰲ"]='v',
	["Ⰳ"]='G', ["ⰳ"]='g', 
	["Ⰴ"]='D', ["ⰴ"]='d',
	["Ⰵ"]='E', ["ⰵ"]='e',
	["Ⰶ"]='Ž', ["ⰶ"]='ž',
	["Ⰷ"]='Dz', ["ⰷ"]='dz',
	["Ⰸ"]='Z', ["ⰸ"]='z',
	["Ⰹ"]='I', ["ⰹ"]='i', ["Ⰺ"]='I', ["ⰺ"]='i', ["Ⰻ"]='I', ["ⰻ"]='i',
	["Ⰼ"]='Đ', ["ⰼ"]='đ',
	["Ⰽ"]='K', ["ⰽ"]='k',
	["Ⰾ"]='L', ["ⰾ"]='l', 
	["Ⰿ"]='M', ["ⰿ"]='m',
	["Ⱀ"]='N', ["ⱀ"]='n',
	["Ⱁ"]='O', ["ⱁ"]='o', ["Ⱉ"]='O', ["ⱉ"]='o',
	["Ⱂ"]='P', ["ⱂ"]='p', 
	["Ⱃ"]='R', ["ⱃ"]='r',
	["Ⱄ"]='S', ["ⱄ"]='s',
	["Ⱅ"]='T', ["ⱅ"]='t',
	["Ⱆ"]='U', ["ⱆ"]='u', 
	["Ⱇ"]='F', ["ⱇ"]='f',
	["Ⱈ"]='X', ["ⱈ"]='x', ["Ⱒ"]='X', ["ⱒ"]='x',
	
	["Ⱌ"]='C', ["ⱌ"]='c',
	["Ⱍ"]='Č', ["ⱍ"]='č', 
	["Ⱎ"]='Š', ["ⱎ"]='š',
	-- For Ⱋ see below
	["Ⱏ"]='Ŭ', ["ⱏ"]='ŭ',
	["Ⱐ"]='Ĭ', ["ⱐ"]='ĭ',
	["Ⱑ"]='Ě', ["ⱑ"]='ě',
	
	["Ⱓ"]='Ju', ["ⱓ"]='ju', 
	["Ⱔ"]='Ę', ["ⱔ"]='ę',
	["Ⱗ"]='Ję', ["ⱗ"]='ję',
	["Ⱘ"]='Ǫ', ["ⱘ"]='ǫ',
	["Ⱙ"]='Jǫ', ["ⱙ"]='jǫ',
	
	["Ⱚ"]='Θ', ["ⱚ"]='θ',
	["Ⱛ"]='Ü', ["ⱛ"]='ü',
}

digraphs["Glag"] = {
	["Ⱏ[ⰉⰊⰹⰺ]"]="Y", ["ⱏ[ⰹⰺ]"]="y",
}

function export.tr(text, lang, sc)
	if not sc then
		sc = require("Module:scripts").findBestScript(text,
			require("Module:languages").getByCode(lang)):getCode()
	end
	
	-- Щ was pronounced differently in Old East Slavic
	if lang == "orv" then
		letters["Cyrs"]["Щ"]='Šč'
		letters["Cyrs"]["щ"]='šč'
		letters["Glag"]["Ⱋ"]='Šč'
		letters["Glag"]["ⱋ"]='šč'
	else
		letters["Cyrs"]["Щ"]='Št'
		letters["Cyrs"]["щ"]='št'
		letters["Glag"]["Ⱋ"]='Št'
		letters["Glag"]["ⱋ"]='št'
	end
	
	-- Transliterate the kamora as prime
	text = string.gsub(text, "\210\132", "ʹ")
	
	if sc == "Cyrs" or sc == "Glag" then
		for key, repl in pairs(digraphs[sc]) do
			text = mw.ustring.gsub(text, key, repl)
		end
		
		-- pattern for one non-ASCII character
		text = string.gsub(text, '[\194-\244][\128-\191]+', letters[sc])
	else
		-- error("This module can only transliterate Old Cyrillic (Cyrs) and Glagolitic (Glag).")
	end

	return text
end

return export
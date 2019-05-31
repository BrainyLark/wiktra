-- This module will transliterate Komi-Zyrian language text per WT:KPV TR. 
-- It is used to transliterate Komi-Permyak (koi) and Komi-Zyrian (kpv).

local export = {}

local tab = {
	["А"]="A", ["Б"]="B", ["В"]="V", ["Г"]="G", ["Д"]="D", ["Е"]="E", ["Ё"]="Jo", ["Ж"]="Ž", ["З"]="Z", ["И"]="I", ["І"]="Ï", ["Й"]="J",
	["К"]="K", ["Л"]="L", ["М"]="M", ["Н"]="N", ["О"]="O", ["Ӧ"]="Ö", ["П"]="P", ["Р"]="R", ["С"]="S", ["Т"]="T", ["У"]="U", ["Ф"]="F",
	["Х"]="X", ["Ц"]="C", ["Ч"]="Č", ["Ш"]="Š", ["Щ"]="Šč", ["Ъ"]="ʺ", ["Ы"]="Y", ["Ь"]="ʹ", ["Э"]="E", ["Ю"]="Ju", ["Я"]="Ja",
	['а']='a', ['б']='b', ['в']='v', ['г']='g', ['д']='d', ['е']='e', ['ё']='jo', ['ж']='ž', ['з']='z', ['и']='i', ['і']='ï', ['й']='j',
	['к']='k', ['л']='l', ['м']='m', ['н']='n', ['о']='o', ['ӧ']='ö', ['п']='p', ['р']='r', ['с']='s', ['т']='t', ['у']='u', ['ф']='f',
	['х']='x', ['ц']='c', ['ч']='č', ['ш']='š', ['щ']='šč', ['ъ']='ʺ', ['ы']='y', ['ь']='ʹ', ['э']='e', ['ю']='ju', ['я']='ja',
}

function export.tr(text, lang, sc)
    -- Ё needs converting if is decomposed
    text = text:gsub("ё","ё"):gsub("Ё","Ё")

    -- е after a vowel or at the beginning of a word becomes je
    text = mw.ustring.gsub(text, "([АОÖУЫЕЯЁЮИIЕЪЬаоöуыэяёюиiеъь%A][\204\129\204\128]?)е","%1je")
    text = mw.ustring.gsub(text, "^Е","Je")
    text = mw.ustring.gsub(text, "^е","je")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])Е","%1Je")
    text = mw.ustring.gsub(text, "([^Ѐ-ӿ])е","%1je")
        
    return (mw.ustring.gsub(text,'.',tab))
end

return export
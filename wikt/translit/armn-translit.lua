-- This module will transliterate text in the Armenian script per WT:ARMN TR. 
-- It is used to transliterate Middle Armenian (axm), Armenian (hye), Northern Kurdish (kmr), 
-- Kipchak (qwm), Udi (udi) and Old Armenian (xcl).

local export = {}

local gsub = mw.ustring.gsub
local mapping = {
	["ա"]="a", ["բ"]="b", ["գ"]="g", ["դ"]="d", ["ե"]="e", ["զ"]="z",["է"]="ē", ["ը"]="ə",
	["թ"]="tʿ", ["ժ"]="ž", ["ի"]="i", ["լ"]="l", ["խ"]="x", ["ծ"]="c", ["կ"]="k", ["հ"]="h",
	["ձ"]="j", ["ղ"]="ł", ["ճ"]="č", ["մ"]="m", ["յ"]="y", ["ն"]="n", ["շ"]="š", ["ո"]="o",
	["չ"]="čʿ", ["պ"]="p", ["ջ"]="ǰ", ["ռ"]="ṙ", ["ս"]="s", ["վ"]="v", ["տ"]="t", ["ր"]="r",
	["ց"]="cʿ", ["ւ"]="w", ["փ"]="pʿ", ["ք"]="kʿ", ["և"]="ew", ["օ"]="ō", ["ֆ"]="f",
	["Ա"]="A", ["Բ"]="B", ["Գ"]="G", ["Դ"]="D", ["Ե"]="E", ["Զ"]="Z", ["Է"]="Ē", ["Ը"]="Ə",
	["Թ"]="Tʿ", ["Ժ"]="Ž", ["Ի"]="I", ["Լ"]="L", ["Խ"]="X", ["Ծ"]="C", ["Կ"]="K", ["Հ"]="H",
	["Ձ"]="J", ["Ղ"]="Ł", ["Ճ"]="Č", ["Մ"]="M", ["Յ"]="Y", ["Ն"]="N", ["Շ"]="Š", ["Ո"]="O",
	["Չ"]="Čʿ", ["Պ"]="P", ["Ջ"]="J̌", ["Ռ"]="Ṙ", ["Ս"]="S", ["Վ"]="V", ["Տ"]="T", ["Ր"]="R",
	["Ց"]="Cʿ", ["Ւ"]="W", ["Փ"]="Pʿ", ["Ք"]="Kʿ", ["Օ"]="Ō", ["Ֆ"]="F", ["ﬓ "]="mn", ["ﬔ"]="me", 
	["ﬕ"]="mi", ["ﬖ"]="vn", ["ﬗ"]="mx",
	 -- punctuation
	["՝"]=",", ["։"]=".", ["․"]=";", ["՛"]="́", ["՜"]="<sup>!</sup>", ["՞"]="<sup>?</sup>", 
	["՟"]=".", ["֊"]="-", ["՚"]="’", ['«']='“', ['»']='”', ['ՙ']='ʿ'
}

local replacements = {
	['յ̵'] = 'ɦ',
	['Ո[ւՒ]'] = 'U',
	['ու'] = 'u',
	['Ո՛[ւՒ]'] = 'Ú',
	['ո՛ւ'] = 'ú',
	['Ո՜[ւՒ]'] = 'U<sup>!</sup>',
	['ո՜ւ'] = 'u<sup>!</sup>',
	['Ո՞[ւՒ]'] = 'U<sup>?</sup>',
	['ո՞ւ'] = 'u<sup>?</sup>',
	['ո̈ւ'] = 'ü',
	['Ո̈[ւՒ]'] = 'Ü',
}

function export.tr(text, lang, sc)
	if sc and sc ~= "Armn" then
		return nil
	end
	
	for regex, replacement in pairs(replacements) do
		text = mw.ustring.gsub(text, regex, replacement)
	end
	
	text = gsub(text, '.', mapping)
	return text
end

return export
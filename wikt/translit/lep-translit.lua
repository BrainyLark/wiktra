-- This module will transliterate Lepcha language text.

local export = {}

local conv = {
	[""] = "",
	["\225\176\128"] = "k", --U+1C00
	["\225\176\129"] = "kl", --U+1C01
	["\225\176\130"] = "kh", --U+1C02
	["\225\176\131"] = "g", --U+1C03
	["\225\176\132"] = "gl", --U+1C04
	["\225\176\133"] = "ng", --U+1C05
	["\225\176\134"] = "c", --U+1C06
	["\225\176\135"] = "ch", --U+1C07
	["\225\176\136"] = "j", --U+1C08
	["\225\176\137"] = "ny", --U+1C09
	["\225\176\138"] = "t", --U+1C0A
	["\225\176\139"] = "th", --U+1C0B
	["\225\176\140"] = "d", --U+1C0C
	["\225\176\141"] = "n", --U+1C0D
	["\225\176\142"] = "p", --U+1C0E
	["\225\176\143"] = "pl", --U+1C0F
	["\225\176\144"] = "ph", --U+1C10
	["\225\176\145"] = "f", --U+1C11
	["\225\176\146"] = "fl", --U+1C12
	["\225\176\147"] = "b", --U+1C13
	["\225\176\148"] = "bl", --U+1C14
	["\225\176\149"] = "m", --U+1C15
	["\225\176\150"] = "ml", --U+1C16
	["\225\176\151"] = "ts", --U+1C17
	["\225\176\152"] = "tsh", --U+1C18
	["\225\176\153"] = "dz", --U+1C19
	["\225\176\154"] = "y", --U+1C1A
	["\225\176\155"] = "r", --U+1C1B
	["\225\176\156"] = "l", --U+1C1C
	["\225\176\157"] = "h", --U+1C1D
	["\225\176\158"] = "hl", --U+1C1E
	["\225\176\159"] = "v", --U+1C1F
	["\225\176\160"] = "s", --U+1C20
	["\225\176\161"] = "sh", --U+1C21
	["\225\176\162"] = "w", --U+1C22
	["\225\176\163"] = "", --U+1C23
	["\225\176\164"] = "y", --U+1C24
	["\225\176\165"] = "r", --U+1C25
	["\225\176\166"] = "aa", --U+1C26
	["\225\176\167"] = "i", --U+1C27
	["\225\176\168"] = "o", --U+1C28
	["\225\176\169"] = "oo", --U+1C29
	["\225\176\170"] = "u", --U+1C2A
	["\225\176\171"] = "uu", --U+1C2B
	["\225\176\172"] = "e", --U+1C2C
	["\225\176\173"] = "k", --U+1C2D
	["\225\176\174"] = "m", --U+1C2E
	["\225\176\175"] = "l", --U+1C2F
	["\225\176\176"] = "n", --U+1C30
	["\225\176\177"] = "p", --U+1C31
	["\225\176\178"] = "r", --U+1C32
	["\225\176\179"] = "t", --U+1C33
	["\225\176\180"] = "ng", --U+1C34
	["\225\176\181"] = "ng", --U+1C35
	["\225\176\182"] = "^", --U+1C36
	["\225\176\183"] = "", --U+1C37
	["\225\176\184"] = "[ta-rol]", --U+1C38
	["\225\176\185"] = "[nyet thyoom ta-rol]", --U+1C39
	["\225\176\186"] = "[cer-wa]", --U+1C3A
	["\225\176\187"] = "[tshook cer-wa]", --U+1C3B
	["\225\176\188"] = "[tshook]", --U+1C3C
	["\225\176\189"] = "0", --U+1C3D
	["\225\176\190"] = "1", --U+1C3E
	["\225\176\191"] = "2", --U+1C3F
	["\225\177\128"] = "3", --U+1C40
	["\225\177\129"] = "4", --U+1C41
	["\225\177\130"] = "5", --U+1C42
	["\225\177\131"] = "6", --U+1C43
	["\225\177\132"] = "7", --U+1C44
	["\225\177\133"] = "8", --U+1C45
	["\225\177\134"] = "9", --U+1C46
	["\225\177\141"] = "tt", --U+1C4D
	["\225\177\142"] = "tth", --U+1C4E
	["\225\177\143"] = "dd", --U+1C4F
}

function export.tr(text, lang, sc)
	local nukta = "\225\176\183"
	
	local initials = "([\225\176\128-\225\176\163\225\177\141-\225\177\143])"
	local medials = "([\225\176\164-\225\176\165]?)"
	local vowels_after = "([\225\176\166\225\176\170-\225\176\172])"
	local vowels_before = "([\225\176\167-\225\176\169])"
	local finals_after = "([\225\176\173-\225\176\179\225\176\182]?)"
	local finals_before = "([\225\176\180\225\176\181]?)"
	local others = "[\225\176\184-\225\177\134]"
	
	local im = initials..medials
	local imf = initials..medials..finals_after
	local fim = finals_before..initials..medials
	
	local imvf = initials..medials..vowels_after..finals_after
	local fimv = finals_before..initials..medials..vowels_after
	local vimf = vowels_before..initials..medials..finals_after
	local fvim = finals_before..vowels_before..initials..medials
	
	text = mw.ustring.gsub(text, nukta, "")
	
	text = mw.ustring.gsub(text, imvf, function(i,m,v,f)
		return conv[i] .. conv[m] .. conv[v] .. conv[f]
	end)
	text = mw.ustring.gsub(text, fimv, function(f,i,m,v)
		return conv[i] .. conv[m] .. conv[v] .. conv[f]
	end)
	text = mw.ustring.gsub(text, vimf, function(v,i,m,f)
		return conv[i] .. conv[m] .. conv[v] .. conv[f]
	end)
	text = mw.ustring.gsub(text, fvim, function(f,v,i,m)
		return conv[i] .. conv[m] .. conv[v] .. conv[f]
	end)
	
	text = mw.ustring.gsub(text, imf, function(i,m,f)
		return conv[i] .. conv[m] .. "a" .. conv[f]
	end)
	text = mw.ustring.gsub(text, fim, function(f,i,m)
		return conv[i] .. conv[m] .. "a" .. conv[f]
	end)
	
	text = mw.ustring.gsub(text, im, function(i,m)
		return conv[i] .. conv[m] .. "a"
	end)
	
	text = mw.ustring.gsub(text, others, conv)
	
	return text
end

return export


-- All tests passed. (refresh)

-- test_translit_lepcha:
-- Text	Expected	Actual	Differs at
-- Passed	ᰈᰬᰲ	jer	jer	
-- -- Unit tests for [[Module:lep-translit]]. Refresh page to run tests.
-- local tests = require('Module:UnitTests')
-- local lep_translit = require('Module:lep-translit')

-- function tests:do_test_translit(lepc, roman, xlit)
-- 	self:equals('<span class="Lepc" lang="hi">[[' .. mw.ustring.gsub(lepc, "%+", "") .. '#Lepcha|' .. mw.ustring.gsub(lepc, "%+", "") .. ']]</span>', lep_translit.tr(lepc, 'lep', 'Lepc'), roman)
-- end

-- function tests:test_translit_lepcha()
-- 	self:do_test_translit('ᰈᰬᰲ', 'jer')
-- end
 
-- return tests
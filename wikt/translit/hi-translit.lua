local export = {}

local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
	-- consonants
	['क'] = 'k', ['ख'] = 'kh', ['ग'] = 'g', ['घ'] = 'gh', ['ङ'] = 'ṅ', 
	['च'] = 'ch', ['छ'] = 'ch', ['ज'] = 'j', ['झ'] = 'jh', ['ञ'] = 'ñ', 
	['ट'] = 'ṭ', ['ठ'] = 'ṭh', ['ड'] = 'ḍ', ['ढ'] = 'ḍh', ['ण'] = 'ṇ',
	['त'] = 't', ['थ'] = 'th', ['द'] = 'd', ['ध'] = 'dh', ['न'] = 'n',
	['प'] = 'p', ['फ'] = 'ph', ['ब'] = 'b', ['भ'] = 'bh', ['म'] = 'm', 
	['य'] = 'y', ['र'] = 'r', ['ल'] = 'l', ['व'] = 'v', ['ळ'] = 'ḷ',
	['श'] = 'ś', ['ष'] = 'ṣ', ['स'] = 's', ['ह'] = 'h',
	['क़'] = 'q', ['ख़'] = 'x', ['ग़'] = 'ġ', ['ऴ'] = 'ḻ',
	['ज़'] = 'z', ['ष़'] = 'ḻ', ['झ़'] = 'ž', ['ड़'] = 'ṛ', ['ढ़'] = 'ṛh',
	['फ़'] = 'f', ['थ़'] = 'θ', ['ऩ'] = 'ṉ', ['ऱ'] = 'ṟ',
	-- ['ज्ञ'] = 'gy',

	-- vowel diacritics
	['ि'] = 'i', ['ु'] = 'u', ['े'] = 'e', ['ो'] = 'o', 
	['ा'] = 'ā', ['ी'] = 'ī', ['ू'] = 'ū', 
	['ृ'] = 'ŕ',
	['ै'] = 'ai', ['ौ'] = 'au',
	['ॉ'] = 'ŏ',
	['ॅ'] = 'ĕ',

	-- vowel signs
	['अ'] = 'a', ['इ'] = 'i', ['उ'] = 'u', ['ए'] = 'e', ['ओ'] = 'o',
	['आ'] = 'ā', ['ई'] = 'ī', ['ऊ'] = 'ū', 
	['ऋ'] = 'ŕ', 
	['ऐ'] = 'ai', ['औ'] = 'au', 
	['ऑ'] = 'ŏ',
	['ऍ'] = 'ĕ',
	
	['ॐ'] = 'om',
	
	-- chandrabindu
	['ँ'] = '̃',
	
	-- anusvara
	['ं'] = 'ṁ',
	
	-- visarga
	['ः'] = 'ḥ',
	
	-- virama
	['्'] = '',
	
	-- numerals
	['०'] = '0', ['१'] = '1', ['२'] = '2', ['३'] = '3', ['४'] = '4',
	['५'] = '5', ['६'] = '6', ['७'] = '7', ['८'] = '8', ['९'] = '9',
	
	-- punctuation
	['।'] = '.', -- danda
	['॥'] = '.', -- double danda
	['+'] = '', -- compound separator
	
	-- abbreviation sign
	['॰'] = '.',
}

local nasal_assim = {
	['क'] = 'ङ', ['ख'] = 'ङ', ['ग'] = 'ङ', ['घ'] = 'ङ', 
	['च'] = 'ञ', ['छ'] = 'ञ', ['ज'] = 'ञ', ['झ'] = 'ञ',  
	['ट'] = 'ण', ['ठ'] = 'ण', ['ड'] = 'ण', ['ढ'] = 'ण',
	['प'] = 'म', ['फ'] = 'म', ['ब'] = 'म', ['भ'] = 'म', ['म'] = 'म',
	['व'] = 'ँ', ['य'] = 'ँ',
}

local perm_cl = {
	['म्ल'] = true, ['व्ल'] = true, ['न्ल'] = true,
	
}

local all_cons, special_cons = 'कखगघङचछजझञटठडढतथदधपफबभशषसयरलवहणनम', 'यरलवहनम'
local vowel, vowel_sign = 'aिुृेोाीूैौॉॅ', 'अइउएओआईऊऋऐऔऑऍ'
local syncope_pattern = '([' .. vowel .. vowel_sign .. '])(़?[' .. all_cons .. '])a(़?[' .. gsub(all_cons, "य", "") .. '])([ंँ]?[' .. vowel .. vowel_sign .. '])'

local function rev_string(text)
	local result, length = {}, mw.ustring.len(text)
	for i = length, 1, -1 do
		table.insert(result, mw.ustring.sub(text, i, i))
	end
	return table.concat(result)
end

function export.tr(text, lang, sc)
	text = gsub(text, '([' .. all_cons .. ']़?)([' .. vowel .. '्]?)', function(c, d)
		return c .. (d == "" and 'a' or d) end)
	for word in mw.ustring.gmatch(text, "[ऀ-ॿa]+") do
		local orig_word = word
		word = rev_string(word)
		word = gsub(word, '^a(़?)([' .. all_cons .. '])(.)(.?)', function(opt, first, second, third)
			return (((match(first, '[' .. special_cons .. ']') and match(second, '्') and not perm_cl[first..second..third])
				or match(first .. second, 'य[ीेै]'))
				and 'a' or "") .. opt .. first .. second .. third end)
		while match(word, syncope_pattern) do
			word = gsub(word, syncope_pattern, '%1%2%3%4')
		end
		word = gsub(word, '(.?)ं(.)', function(succ, prev)
			return succ .. (succ..prev == "a" and "्म" or 
				(succ == "" and match(prev, '[' .. vowel .. ']') and "̃" or nasal_assim[succ] or "n")) .. prev end)
		text = gsub(text, orig_word, rev_string(word))
	end
	text = gsub(text, '.़?', conv)
	text = gsub(text, 'a([iu])̃', 'a͠%1')
    text = gsub(text, 'jñ', 'gy')
    text = gsub(text, 'ñz', 'nz')
	return mw.ustring.toNFC(text)
end

return export
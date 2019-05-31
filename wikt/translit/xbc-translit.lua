-- This module will transliterate Bactrian language text.
-- Language code : xbc
local export = {}

local mapping = {
	["α"] = "a",  ["β"] = "b",  ["γ"] = "g",  ["δ"] = "d",  ["ε"] = "e",  ["ζ"] = "z",
	["η"] = "ē",  ["θ"] = "θ",  ["ι"] = "i",  ["κ"] = "k",  ["λ"] = "l",  ["μ"] = "m",
	["ν"] = "n",  ["ο"] = "o",  ["π"] = "p",  ["ρ"] = "r",  ["ϸ"] = "š",  ["σ"] = "s",
	["τ"] = "t",  ["υ"] = "u",  ["φ"] = "f",  ["χ"] = "x",  ["ω"] = "ō",  ["ς"] = "s",
	
	["Α"] = "A",  ["Β"] = "B",  ["Γ"] = "G",  ["Δ"] = "D",  ["Ε"] = "E",  ["Ζ"] = "Z",
	["Η"] = "Ē",  ["Θ"] = "Θ",  ["Ι"] = "I",  ["Κ"] = "K",  ["Λ"] = "L",  ["Μ"] = "M",
	["Ν"] = "N",  ["Ο"] = "O",  ["Π"] = "P",  ["Ρ"] = "R",  ["Ϸ"] = "Š",  ["Σ"] = "S",
	["Τ"] = "T",  ["Υ"] = "U",  ["Φ"] = "F",  ["Χ"] = "X",  ["Ω"] = "Ō",
}

function export.tr(text, lang, sc)
	if sc == "Grek" then
		text = string.gsub(text, "[\1-\127\194-\244][\128-\191]*", mapping)
		return text
	end
end

return export
def phrase_builder (shift, string)

	phrase = string.split(' ')
	crypto_phrase = []

	@orig_alpha = "abcdefghijklmnopqrstuvwxyz".split('')
	@shifted_alpha = "abcdefghijklmnopqrstuvwxyz".split('')

	looper = 0
	while looper < shift.abs
		if shift < 0
			@shifted_alpha.unshift(@shifted_alpha.pop)
		else 
			@shifted_alpha << @shifted_alpha.shift
		end
		looper += 1
	end

	phrase.each do |word|
		crypto_phrase << crypto_word(word)
	end

	crypto_phrase.join(' ')
	
end

def crypto_word (word)
	word_to_change = word.split('')
	changed_word = []

	word_to_change.each_with_index do |letter, index|
		changed_word << @shifted_alpha[@orig_alpha.index(letter)]
	end

	changed_word.join('')
end


puts phrase_builder(1, "child ban")
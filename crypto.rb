def crypto (shift, string)

	orig_alpha = "abcdefghijklmnopqrstuvwxyz".split('')
	shifted_alpha = "abcdefghijklmnopqrstuvwxyz".split('')
	word_to_change = string.split('')
	crypto_word = []

	looper = 0
	while looper < shift.abs
		if shift < 0
			shifted_alpha.unshift(shifted_alpha.pop)
		else 
			shifted_alpha << shifted_alpha.shift
		end
		looper += 1
	end

	word_to_change.each_with_index do |letter, index|
		crypto_word << shifted_alpha[orig_alpha.index(letter)]
	end

	string + ' = ' + crypto_word.join('')

end


puts crypto(1, "child")
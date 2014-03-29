def phrase_builder (shift, string)

	phrase = string.split(' ')
	crypto_phrase = []

	orig_alpha = "abcdefghijklmnopqrstuvwxyz".split('')
	shifted_alpha = "abcdefghijklmnopqrstuvwxyz".split('')
	vowels = ['a','e','i','o','u']
	symbols = ['!','%','#','?','&']

	looper = 0
	while looper < shift.abs
		if shift < 0
			shifted_alpha.unshift(shifted_alpha.pop)
		else 
			shifted_alpha << shifted_alpha.shift
		end
		looper += 1
	end

	@alpha_hash = {}

	orig_alpha.each_with_index do |letter, index|
		@alpha_hash[orig_alpha[index]] = shifted_alpha[index]
	end

	vowel_loop = 0
	@alpha_hash.each_pair do |k,v|
		if vowels.include?(v)
			@alpha_hash[k] = symbols[vowel_loop]
			vowel_loop += 1
		end
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
		changed_word << @alpha_hash[letter]
	end

	changed_word.join('')
end


puts phrase_builder(1, "bat man")
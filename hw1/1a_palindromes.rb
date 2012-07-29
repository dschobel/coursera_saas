def palindrome?(input)
    clean = (input.scan /\w/).map { |x| x.downcase }
    clean == clean.reverse
end

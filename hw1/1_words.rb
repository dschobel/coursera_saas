def palindrome?(input)
    clean = (input.scan /\w/).map { |x| x.downcase }
    clean == clean.reverse
end

def count_words(string)
    r = {}
    string.split.each do |word|
        l = word.downcase
        if r.has_key? l
            r[l]+=1
        else
            r[l]=1
        end
    end
    r
end

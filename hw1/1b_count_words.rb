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


puts count_words "A man, a plan, a canal -- Panama"
puts count_words "Doo bee doo bee doo"

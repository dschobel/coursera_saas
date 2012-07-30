def combine_anagrams(words)
    result = words.reduce({}) do |r,v|
        key = v.downcase.split(//).sort.join.to_sym
        if r.has_key? key
            r[key].push v
        else
            r[key] = [v]
        end
        r
    end
    result.values
end

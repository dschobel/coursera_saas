class Dessert
    def initialize(name, calories)
        @calories = calories
        @name = name
    end


    def healthy?
        @calories < 200
    end
    def delicious?
        true
    end

    attr_accessor :name, :calories

end
class JellyBean < Dessert
    def initialize(name, calories, flavor)
        super(name,calories)
        @flavor = flavor
    end
    
    attr_accessor :flavor

    def delicious?
        @flavor != "black licorice"
    end
end

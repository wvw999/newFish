require 'pry'
class House
    attr_reader :number
    attr_accessor :color, :nationality, :pet, :smoke, :drink
    def initialize(number)
        @number = number
        @color = {"red" => 9, "blue" => 9, "green" => 9, "white" => 9, "yellow" => 9}
        @nationality = {"german" => 9, "british" =>9, "norwegian" =>9, "danish" =>9, "swedish" =>9}
        @pet = {"dog" =>9, "birds" =>9, "fish" =>9, "horse" =>9, "cat" =>9}
        @smoke = {"blends" =>9, "pallmall" =>9, "bluemaster" =>9, "dunhill" =>9, "prince" =>9}
        @drink = {"milk" =>9, "water" =>9, "beer" =>9, "tea" =>9, "coffee" =>9}
    end
    def attrs
        instance_variables.map{|ivar| instance_variable_get ivar}
    end
end

@one = House.new(1)
@two = House.new(2)
@three = House.new(3)
@four = House.new(4)
@five = House.new(5)
@names = [@one, @two, @three, @four, @five]
@clues = [:color, @nationality, @pet, @drink, @smoke]

@number_array = [[3 => "milk"], [1 => "norwegian"]]

@neighbor_one = [["blends", "cat"], ["horse", "dunhill"], ["norwegian", "blue"]]

@neighbor_two = ["green", "white"]

@pairs_array = [["british", "red"], ["swedish", "dog"], ["danish", "tea"], ["green", "coffee"], ["pallmall", "birds"], ["yellow", "dunhills"], ["bluemaster", "beer"], ["german", "princes"] ]

def compare(a,b,c,d)
    if a.b[c] == 1
        a.b[d] = 1
    end
    if a.b[c] == 0
        a.b[d] = 0
    end
end    

def a_and_b
    # check data pairs
    # @test[3].color
    # @test[3].color["red"] = 1
    # @test[0].color["red"] -- returns value
    # if A, set B, & vice versa
    @pairs_array.each do |a|
        @first = a[0]
        @second = a[1]
       # binding.pry
        @names.each do |b|
            @clues.each do |c|
                binding.pry
                # puts b.c
                # compare(b,c,@first,@second)
                # compare(b,c,@second,@first)
            end
            # binding.pry
        end
    end
    # @one.color.each do |key,val|
    #     puts key
    #     puts val
    # end
    # if is set to not A or not B, set pair to not
    # binding.pry
end

@test2 = a_and_b
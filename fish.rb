require 'pry'
class House
    attr_reader :number
    attr_accessor :color, :nationality, :pet, :smoke, :drink
    def initialize(number)
        @number = number
        @color = {"red" => 9, "blue" => 9, "green" => 9, "white" => 9, "yellow" => 9}
        @nationality = {"german" => 9, "british" =>9, "norwegian" =>9, "danish" =>9, "swedish" =>9}
        @pet = {"dog" =>9, "birds" =>9, "fish" =>9, "horse" =>9, "cat" =>9}
        @smoke = {"blend" =>9, "pallmall" =>9, "bluemaster" =>9, "dunhill" =>9, "prince" =>9}
        @drink = {"milk" =>9, "water" =>9, "beer" =>9, "tea" =>9, "coffee" =>9}
    end
end

@one = House.new(1)
@two = House.new(2)
@three = House.new(3)
@four = House.new(4)
@five = House.new(5)
@names = [@one, @two, @three, @four, @five]
@attribs = [:color, :nationality, :pet, :drink, :smoke]

@neighbor_one = [[:smoke, "blend", :pet,  "cat"], [:pet, "horse", :smoke, "dunhill"], [:nationality, "norwegian", :color, "blue"]]

@neighbor_two = [:color, "green", :color, "white"]


@pairs_array = [[:nationality, "british", :color "red"], [nationality, "swedish", :pet, "dog"], [:nationality, "danish", :drink, "tea"], [:color, "green", :drink "coffee"], [:smoke, "pallmall", :pet, "birds"], [:color, "yellow", :smoke, "dunhill"], [:smoke, "bluemaster", :drink, "beer"], [:nationality, "german", :smoke, "prince"] ]

@neighbor_map = [[@one,@two], [@two,@one,@three], [@three,@two,@four], [@four,@three,@five], [@five,@four]]

def compare(house,attrib,clueone,cluetwo)
    if house.public_send(attrib)[clueone] == 1
end

# first two attribs are direct assignments and need no logic to locate them, just setting them directly
def specific
    @three.drink["milk"] = 1
    @one.nationality["norwegian"] = 1
end

specific

def both_neighbor
    @neighbor_one.each do |clue|
        @attribs.each do |attrib|
        @neighbor_map.each do |location|
            if location.length ==2
                compare(location[0], attrib, )
            else

            end
        end
    end
end

def pair_check
    # @test[3].color["red"] = 1
    # @test[0].color["red"] -- returns value
    @pairs_array.each do |a|
        @first = a[0]
        @second = a[1]
       # binding.pry
        @names.each do |house|
            @attribs.each do |cclue|
                compare(house,clue,@first,@second)
                compare(house,clue,@second,@first)
            end
            # binding.pry
        end
    end
end

@test2 = pair_check
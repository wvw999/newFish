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
@attribute = [:nationality, :smoke, :color, :drink, :pet]

@neighbor_one = [[:smoke, "blend", :pet,  "cat"], [:pet, "horse", :smoke, "dunhill"], [:nationality, "norwegian", :color, "blue"]]

@neighbor_two = [:color, "green", :color, "white"]

@clue_pairs = [[:nationality, "british", :color "red"], [nationality, "swedish", :pet, "dog"], [:nationality, "danish", :drink, "tea"], [:color, "green", :drink "coffee"], [:smoke, "pallmall", :pet, "birds"], [:color, "yellow", :smoke, "dunhill"], [:smoke, "bluemaster", :drink, "beer"], [:nationality, "german", :smoke, "prince"] ]

@neighbor_map = [[@one,@two], [@two,@one,@three], [@three,@two,@four], [@four,@three,@five], [@five,@four]]

def compare(house,attr_one,val_one,attr_two,val_two)
    if house.public_send(attr_one)[val_one] == 1
        house.public_send(attr_two)[val_two] = 1
    end
    if house.public_send(attr_one)[val_one] == 0
        house.public_send(attr_two)[val_two] = 0
    end
end

def both_neighbor
    @neighbor_one.each do |clue|
        @attr_one = clue[0]
        @val_one = clue[1]
        @attr_two = clue[2]
        @val_two = clue[3]
        @attribs.each do |attrib|
            @neighbor_map.each do |location|
                if location.length == 2
                    if location[0].public_send(@attr_one)[@val_one] == 1
                        location[1].public_send(@attr_two)[@val_two] = 1
                    end
                    if location[0].public_send(@attr_two)[@val_two] == 1
                        location[1].public_send(@attr_one)[@val_one] = 1
                    end
                else
                    if location[0].public_send(@attr_one)[@val_one] == 1 && location[1].public_send(@attr_two)[@val_two] == 0 && location[2].public_send(@attr_two)[@val_two] == 9
                        location[2].public_send(@attr_two)[@val_two] = 1
                    elsif location[0].public_send(@attr_one)[@val_one] == 1 && location[1].public_send(@attr_two)[@val_two] == 9 && location[2].public_send(@attr_two)[@val_two] == 0
                        location[1].public_send(@attr_two)[@val_two] = 1
                    end
                end
            end
        end
    end
end

def one_neighbor
    @neighbor_two.each do |clue|
        @attr_one = clue[0]
        @val_one = clue[1]
        @attr_two = clue[2]
        @val_two = clue[3]
        @names.each do |house|
            plus_one = @names.index(house) + 1
            minus_one = @names.index(house) - 1
            if house.color[@val_one] == 1
                @names[plus_one].color[@val_two] = 1
            elsif house.color[@val_two] == 1
                @names[minus_one].color[@val_one] = 1
            end
        end
    end
end

def pair_check
    @clue_pairs.each do |clue|
        @attr_one = clue[0]
        @val_one = clue[1]
        @attr_two = clue[2]
        @val_two = clue[3]
        @names.each do |house|
            compare(house,@attr_one,@val_one,@attr_two,@val_two)
            compare(house,@attr_two,@val_two,@attr_one,@val_one)
        end
    end
end

# if a value is 1, or 4 are 0, complete setting others values for that attribute
# additionally, if any house attribute value is 1, set it to 0 for all the other houses
def janitor
    @names.each do |house|
        @attribute.each do |attrib|
            negatory = house.public_send(attrib).select {|k,v| v == 0}
            incomplete = house.public_send(attrib).select {|k,v| v == 9}
            complete = house.public_send(attrib).select {|k,v| v == 1}
            if complete.length == 1 && negatory.length == 4
                negatory.each do |key,val|
                    house.public_send(attrib)[key] = 0
                end
            elsif complete.length == 1 && negatory.length < 4
                combined = negatory.merge(incomplete)
                combined.each do |key,val|
                    house.public_send(attrib)[key] = 0
                end
            elsif negatory.length == 4 && incomplete.length == 1
                incomplete.each_key {|key| @update = key}
                house.public_send(attrib)[@update] = 1
            end
        end
    end
    @names.each do |house|
        @attribute.each do |attrib|
            complete = house.public_send(attrib).select {|k,v| v == 1}
            if complete != nil
                complete.each_key {|key| @update = key}
                @names.each do |negate|
                    if negate != house
                        house.public_send(@update) = 0
                    end
                end
            end
        end
    end
end

# first two clues are direct assignments and need no logic to locate them, just setting them directly
@three.drink["milk"] = 1
@one.nationality["norwegian"] = 1

10.times do |cycle|
    pair_check
    janitor
    one_neighbor
    janitor
    both_neighbor
    janitor
    @names.each do |look|
        print look
        puts " "
    end
end
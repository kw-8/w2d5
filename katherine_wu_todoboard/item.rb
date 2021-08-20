
class Item
    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_string)
        return false if date_string.length != 10 || date_string[4]+date_string[7] != "--"
        ( (1..12).include?(date_string[5..6].to_i) && (1..31).include?(date_string[8..9].to_i) ) && date_string[0..3].split("").all? {|i| "1234567890".include?(i)}
    end

    def initialize(title, deadline, description)
        if self.class.valid_date?(deadline)
            @deadline = deadline
        else raise "not a valid deadline"
        end
        @title = title
        @description = description
    end

    def deadline=(new_deadline)
        if self.class.valid_date?(deadline)
            @deadline = new_deadline
        else raise "not a valid deadline"
        end
    end

end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date
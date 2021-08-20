require "byebug"
require_relative "item"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, *description)
        description = ""
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            true
        else false
        end
    end
    
    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && index < self.size
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        else false
        end
    end

    def [](index)
        valid_index?(index) ? @items[index] : nil
    end

    def priority
        @items.first
    end

    def print
        puts "="*35 + "\n" + @label.center(35) + "\n" + "-"*35
        @items.each_with_index{|item, index| puts index.to_s.ljust(5) + item.title.ljust(20) + item.deadline.ljust(10)}
        puts "="*35
    end

    def print_full_item(index)
        item = @items[index]
        puts "-"*35 + "\n" + item.title.ljust(25) + item.deadline
        puts item.description
        puts "-"*35
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, *amount)
        amount = amount.first || 1
        if valid_index?(index)
            while amount > 0
                swap(index, index-1)
                index -= 1 if index > 0
                amount -= 1
            end
            true
        else false
        end
    end

    def down(index, *amount)
        amount = amount.first || 1
        # debugger
        if valid_index?(index)
            while amount > 0
                swap(index, index+1)
                index += 1 if index <= @items.length
                amount -= 1
            end
            true
        else false
        end
    end

    def sort_by_date
        @items.sort_by!{|item| item.deadline}
    end
end

# p liszt = List.new("liszt's daily diet")
# p liszt.add_item("cabbage", "1835-01-01")
# p liszt.add_item("wurst", "1835-01-02", "a sausage bought down the street")
# p liszt.add_item("composition paper", "1835-01-04")
# p liszt.add_item("coffee", "1835-01-03")
# p liszt.size
# p liszt.print
# p liszt.swap(2,3)
# p liszt.print
# p liszt.print_full_item(1)
# p liszt.down(0)
# p liszt.print
# p liszt.sort_by_date
# p liszt.print
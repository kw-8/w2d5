require_relative "item"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, *description)
        description ||= ""
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

    # def print

end
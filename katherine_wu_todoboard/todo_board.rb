require_relative "list"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        puts "\nEnter a command: "
        cmd, *args = gets.chomp.split(" ")
        
        case cmd
        when "mktodo"
            @list.add_item(*args)
            return true
        when "up"
            @list.up(*args.map{|arg| arg.to_i})
            return true
        when "down"
            @list.down(*args.map{|arg| arg.to_i})
            return true
        when "swap"
            @list.swap(*args.map{|arg| arg.to_i})
            return true
        when "sort"
            @list.sort_by_date
            return true
        when "priority"
            @list.print_priority
            return true
        when "print"
            args.empty? ? @list.print : @list.print_full_item(*args.map{|arg| arg.to_i})
            return true
        when "toggle"
            @list.toggle_item(*args.map{|arg| arg.to_i})
            return true
        when "rm"
            @list.remove_item(*args.map{|arg| arg.to_i})
            return true
        when "purge"
            @list.purge
            return true
        when "quit"
            return false
        end
    end

    def run
        continue = true
        while continue == true
            continue = self.get_command
        end
    end
end
#mktodo cheese 2019-10-25 foooooood
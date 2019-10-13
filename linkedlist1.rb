class LinkedList
  attr_accessor :first_node
  attr_accessor :last_node

  def add_node(value)
    new_node = LinkedListNode.new(value)

    
    self.first_node ||= new_node

    if last_node
      last_node.next_node = new_node
    end

    self.last_node = new_node
  end

  
  def print_values(list_node=first_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
  end
end

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
    attr_reader :data

    def initialize
        @data = nil
    end

    
    def push(value)
        
        @data = LinkedListNode.new(value, @data)
    end

    
    def pop
        return nil if @data.nil?
        top_stack_value = @data.value
        @data = @data.next_node
        top_stack_value
    end

end

def reverse_list(list)
    stack = Stack.new
    node = list.first_node

    while node
        stack.push(node.value)
        node = node.next_node
    end

    reversed_list = LinkedList.new
    while value = stack.pop
        reversed_list.add_node(value)
    end
    reversed_list
end

list = LinkedList.new
list.add_node(12)
list.add_node(99)
list.add_node(37)
list.print_values
puts "---------"

reversed_list = reverse_list(list)
reversed_list.print_values
class Node
  attr_accessor :next
  attr_reader   :value
 
  def initialize(value)
    @value = value
    @next  = nil
  end
 
  def to_s
    "#{@value}"
  end
end

class LinkedList
  def initialize
    @head = nil
    @showList = []
  end
 
  def append(value)
    if @head
      find_tail.next = Node.new(value)
    else
      @head = Node.new(value)
    end
  end
 
  def find_tail
    node = @head
 
    return node if !node.next
    while (node = node.next) do
      if !node.next then 
        return node 
      end
    end
  end
 
  def insert_after(target, value)
    node = find(target)
 
    return unless node
 
    old_next       = node.next
    node.next      = Node.new(value)
    node.next.next = old_next
  end
 
  def find(value)
    node = @head
 
    return false if !node.next
    return node  if node.value == value
 
    while (node = node.next)
      return node if node.value == value
    end
  end
 
  def delete(value)
    if @head.value == value
      @head = @head.next
      return
    end
 
    node      = find_before(value)
    node.next = node.next.next
  end
 
  def find_before(value)
    node = @head
 
    return false if !node.next
    return node  if node.next.value == value
 
    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end
  
  def lenght(node)
    count = 1
    while node.next do
      count +=1
      node = node.next
    end
    return count
  end
 
  def print
    node = @head
    @showList.push(node.to_s)
    # puts node
 
    while (node = node.next)
      @showList.push(node.to_s)
      # puts node
    end
    return @showList
  end
end
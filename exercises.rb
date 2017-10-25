# 1
def kaprekar?(k)
  square = k**2
  square_array = square.to_s.split('')
  (square_array.length).times do |n|
    sum = square_array[0..n].join.to_i + square_array[n+1..-1].join.to_i
    return true if sum == k
  end
  return false
end


# 2
class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    orders.inject(0) { |total_cost, order| 
      total_cost + order.keys.inject(0) { |cost, key|
        cost + (@menu[key] * order[key]) }
    }
  end
end

# 3
class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    if block_given?
      sum = initial_value
      @array.each do |element|
        sum += yield(element)
      end
      return sum
    else
      initial_value + @array.inject(0){|sum, value| sum += value }
    end
  end
end


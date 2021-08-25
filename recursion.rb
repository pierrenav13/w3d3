def range(n_s, n_e)
  return [n_s] if n_e == n_s + 1
  range(n_s, n_e - 1) + [n_e - 1]
end

# p range(1, 5)

def sum(array)
  return array[0] if array.length == 1
  array[0] + sum(array[1..-1])
end

def sum_it(array)
  sum = array.inject { |acc, ele| acc + ele }
end

# p sum([1,2,3])
# p sum_it([1,2,3])

def exponentiation_1(b, n)
  return 1 if n == 0
  return b if n == 1
  b * exponentiation_1(b, n - 1)
end

#p exponentiation_1(2, 4)

def exponentiation_2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exponentiation_2(b, n / 2) ** 2
  else
    b * (exponentiation_2(b, (n - 1) / 2) ** 2)
  end
end

#p exponentiation_2(2, 5)

class Array
  def deep_dup
    arr = Array.new
    old_arr = self.map {|ele| ele}
    old_arr.each do |ele|
        unless ele.is_a?(Array)
            arr += [ele]
        else
            arr += ele.deep_dup
        end
    end
  end
end

# a = [1, [2], [3, [4]]]
# p a.object_id
# p b = a.deep_dup
# p b.object_id

def fibonacci(n)
    return 1 if n == 1
    return 1 if n == 2
    fibonacci(n-1) + fibonacci(n-2)
end

# p fibonacci(3)
# p fibonacci(4)
# p fibonacci(5)
# p fibonacci(6)

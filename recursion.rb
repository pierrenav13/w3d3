require "byebug"

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
    old_arr = self.map { |ele| ele }
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
  fibonacci(n - 1) + fibonacci(n - 2)
end

# p fibonacci(3)
# p fibonacci(4)
# p fibonacci(5)
# p fibonacci(6)

def bsearch(array, target)
  middle_idx = array.length / 2
  middle = array[middle_idx]

  return middle_idx if target == middle
  return nil if array.length == 1
  if target < middle
    return bsearch(array[0...middle_idx], target)
  elsif target > middle
    b_searched = bsearch(array[middle_idx..-1], target)
    if b_searched == nil
      return nil
    else
      return middle_idx + b_searched
    end
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
  return [] if array.length == 0
  return array if array.length == 1
  middle_idx = array.length / 2
  arr_1 = array[0...middle_idx]
  arr_2 = array[middle_idx..-1]
  merge(merge_sort(arr_1), merge_sort(arr_2))
end

def merge(ele_1, ele_2)
  merged = ele_1 + ele_2
  merged.each_with_index do |el1, i1|
    merged.each_with_index do |el2, i2|
      if i2 > i1
        if el1 > el2
          merged[i1], merged[i2] = merged[i2], merged[i1]
        end
      end
    end
  end
end


def subsets(array)
    return [[]] if array.length == 0
    return [[],array] if array.length == 1
    debugger
    subs = subsets(array[0...-1])
    subs.each do |ele|
        unless ele.include?(array[-1])
            subs << ele+[array[-1]]
        end
    end
    subs
end

def permutations(array)
    subsets = subsets(array)
    return array if subsets.include?(array)
end

def greedy_make_change(num, coins = [25, 10, 5, 1])
    return [] if num == 0
    result = Array.new
    num_coins = num / coins[0]
    num_coins.times {result << coins[0]}
    num -= coins[0]*num_coins
    result += greedy_make_change(num,coins[1..-1])
end

def make_better_change(num, coins = [25, 10, 5, 1])
    return [] if num == 0
    results = []
    result_2 = nil
    result = []

    coins.each_with_index do |coin, i|
        n = num
        if n >= coin
            n -= coin
            result = [coin] 
            result += make_better_change(n, coins)
            if result_2.nil? || result.length < result_2.length 
                result_2 = result
            end
        end
    end
    result_2

end

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
    sum = array.inject {|acc, ele| acc + ele}
end

# p sum([1,2,3])
# p sum_it([1,2,3])

def exponentiation_1(b, n)
    return 1 if n == 0
    return b if n == 1
    b * exponentiation_1(b, n - 1)
end

p exponentiation_1(2, 4)
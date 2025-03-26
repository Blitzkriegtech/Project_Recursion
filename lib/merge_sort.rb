# frozen_string_literal: true

# Note the p is for checking purposes only
def merge_sort(arr)
  return arr if arr.length <= 1 # base case

  mid_term = arr.length / 2
  # recursive case
  p left_arr = merge_sort(arr.take(mid_term))
  p right_arr = merge_sort(arr.drop(mid_term))

  merge(left_arr, right_arr)
end

def merge(left_arr, right_arr)
  # base case
  if left_arr.empty?
    right_arr
  elsif right_arr.empty?
    left_arr
  # recursive case
  elsif left_arr.first < right_arr.first
    p [left_arr.first] + merge(left_arr[1..], right_arr)
  else
    p [right_arr.first] + merge(left_arr, right_arr[1..])
  end
end

arr = [3, 2, 1, 13, 8, 5, 0, 1]
arr2 = [105, 79, 100, 110]

puts "This is for array 1: #{merge_sort(arr)}"
puts "This is for array 2: #{merge_sort(arr2)}"

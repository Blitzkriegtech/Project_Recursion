# frozen_string_literal: true

def merge_sort(arr)
  return arr if arr.length <= 1

  mid_term = arr.length / 2
  left_arr = merge_sort(arr.take(mid_term))
  right_arr = merge_sort(arr.drop(mid_term))
  merge(left_arr, right_arr)
end

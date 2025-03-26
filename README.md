# Project_Recursion
Tackle two classic problems: Fibonnaci and Merge sort using recursion

This project demonstrates various recursive techniques in Ruby. It includes implementations for generating the Fibonacci sequence using both iterative (with inject) and recursive approaches, as well as a merge sort algorithm that uses recursion for splitting and merging arrays.

#Table of Contents
- Overview

- Fibonacci Sequence

    - Fibonacci with Inject (Iterative method)

    - Recursive Fibonacci (Array Version)

- Merge Sort

    -Merge Function

    -Merge Sort Function

- Usage

- License

# Overview
    This repository includes Ruby code that demonstrates:

    - Building the Fibonacci sequence using Ruby's inject method.

    - Calculating Fibonacci numbers with recursion, returning either a single Fibonacci number or the entire    sequence as an array.

    - Implementing the merge sort algorithm by recursively splitting and merging arrays.

# Fibonacci Sequence

## Fibonacci with Inject

    This implementation uses the inject method to build an array containing the Fibonacci sequence. It starts with a base array of [0, 1] and uses a range to iterate from the 3rd term onward, appending each new term computed as the sum of the last two elements.

    ```ruby
    def fibs(num)
      return [] if num <= 0         # Return empty array for non-positive input.
      return [0] if num == 1        # Return only [0] if num is 1.
      return [0, 1] if num == 2     # Return [0, 1] if num is 2.

      (3..num).inject([0, 1]) { |fib| fib << fib.last(2).inject(:+) }
    end

    puts fibs(8)  # Expected output: [0, 1, 1, 2, 3, 5, 8, 13]
    ```

# Recursive Fibonacci (Array Version)
## This version builds and returns the entire Fibonacci sequence as an array. The base cases return the appropriate array based on the requested length. For numbers greater than 2, it recursively builds the sequence and appends the next Fibonacci number.

```ruby

def fibs_rec(num)
  return [] if num <= 0        # Return empty array for non-positive input.
  return [0] if num == 1        # Return [0] if num is 1.
  return [0, 1] if num == 2     # Return [0, 1] if num is 2.

  previous_sequence = fibs_rec(num - 1)
  previous_sequence << previous_sequence[-1] + previous_sequence[-2]
end

p fibs_rec(8)  # Expected output: [0, 1, 1, 2, 3, 5, 8, 13]
```

# Merge Sort
    The merge sort algorithm is implemented in two parts: a merge function that combines two sorted arrays into one, and a merge_sort function that recursively splits an array and then merges the sorted halves.

# Merge Function
    The merge function compares the first elements of two sorted arrays and recursively builds a new sorted array. Notice how it uses array slicing ([1..-1]) and array concatenation with the + operator.

```ruby

def merge(left_arr, right_arr)
  if left_arr.empty?
    right_arr
  elsif right_arr.empty?
    left_arr
  elsif left_arr.first < right_arr.first
    [left_arr.first] + merge(left_arr[1..-1], right_arr)
  else
    [right_arr.first] + merge(left_arr, right_arr[1..-1])
  end
end
```

# Merge Sort Function
    The merge_sort function recursively splits the input array into halves until arrays of length 1 or 0 are reached. It then uses the merge function to combine these arrays back together in sorted order.

```ruby

def merge_sort(arr)
  return arr if arr.length <= 1

  mid_term = arr.length / 2
  left_arr = merge_sort(arr.take(mid_term))
  right_arr = merge_sort(arr.drop(mid_term))
  merge(left_arr, right_arr)
end
```

# Usage
    To run any of these methods, simply execute the Ruby file. For example, if you save the code in a file called recursion_project.rb, you can run it using:

```bash
ruby recursion_project.rb
```
Make sure Ruby is installed on your machine. The code includes examples of printing both the Fibonacci sequence and the result of the merge sort.

# License
This project is open source and available under the MIT License.

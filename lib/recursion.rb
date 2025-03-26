# frozen_string_literal: true

def fibs(n_length)
  return [] if n_length.zero?
  return [0] if n_length == 1
  return [0, 1] if n_length == 2

  (3..n_length).reduce([0, 1]) { |fib| fib << fib.last(2).inject(:+) }
end

puts "This is done iteratively. #{fibs(8)}"

def fibs_recur(n_length)
  # base case
  return [] if n_length.zero?
  return [0] if n_length == 1
  return [0, 1] if n_length == 2

  # recurssive case
  previous_sequence = fibs_recur(n_length - 1)
  previous_sequence << previous_sequence[-1] + previous_sequence[-2]
end

puts "This is done recurssively. #{fibs_recur(8)}"

# frozen_string_literal: true

module Fibonacci
  class Iterative
    def self.call(n)
      result = 1
      previous = 1

      (2..n).each do
        result, previous = previous + result, result
      end

      result
    end
  end
end

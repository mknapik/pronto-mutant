# frozen_string_literal: true

module Fibonacci
  class Dummy

  end

  class Iterative
    class Boo

    end

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

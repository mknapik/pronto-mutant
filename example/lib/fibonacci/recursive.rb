require_relative '../fibonacci'

module Fibonacci
  class Recursive
    def self.call(n)
      return 1 if n.zero? || n == 1
      call(n - 2) + call(n - 1)
    end
  end
end
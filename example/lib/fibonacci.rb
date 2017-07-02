# frozen_string_literal: true

class Fibonacci
  class Recursive
    def self.call(n)
      return 1 if n.zero? || n == 1
      call(n - 2) + call(n - 1)
    end
  end

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

  class Cached
    def self.call(n)
      @cache ||= build_cache
      @cache[n]
    end

    def self.build_cache
      Hash.new { |h, k| h[k - 1] + h[k - 2] }.tap { |h| h[0] = h[1] = h[0.0] = h[1.0] = 1 }
    end
  end
end

# frozen_string_literal: true

module Fibonacci
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

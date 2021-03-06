# frozen_string_literal: true

require 'ast'
require 'parser/current'
require 'pp'
require 'pry'
require_relative '../mutant'
#
# class MyProcessor
#   include AST::Processor::Mixin
#
#   def on_module_or_class(node)
#     left, right = *node
#
#     binding.pry
#     node.updated(node.type, [
#       left.children.last,
#       process(right)
#     ])
#   end
#
#   alias_method :on_module,      :on_module_or_class
#   alias_method :on_class,      :on_module_or_class
#
#   def handler_missing(node)
#     raise "Missing node type #{node.type}"
#   end
# end

# include AST::Sexp
# s = File.read('example/lib/fibonacci/iterative.rb')
# parsed = Parser::CurrentRuby.parse(s)
#
# processor = MyProcessor.new
# pp processor.process(parsed)

module Pronto
  class Mutant < Runner
    class Traverser
      def dfs(node, prefix = [])
        return [] if node.nil?
        result = []

        if node.respond_to?(:type)
          case node.type
          when :module
            left, right = *node
            mod = left.children.last
            full_module = prefix + [mod]
            result << full_module
            result += dfs(right, full_module)
          when :class
            left, _, right = *node
            klass = left.children.last
            full_klass = prefix + [klass]
            result << full_klass
            result += dfs(right, full_klass)
          else
            node.children.each do |e|
              result += dfs(e, prefix)
            end
          end
        end

        result
      end

      def classes(sexp)
        dfs(sexp).map { |p| p.join('::') }
      end
    end
  end
end

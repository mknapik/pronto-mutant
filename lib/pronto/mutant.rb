# frozen_string_literal: true

require 'pronto'
require 'mutant'
require 'pp'
require 'parser'
require_relative 'mutant/traverser'

module Pronto
  class Mutant < Runner
    def initialize(patches, commit)
      super(patches, commit)
    end

    def run
      source_paths = ruby_patches
                       .lazy
                       .map(&:new_file_full_path)
                       .reject(&method(:test_path?))
                       .map { |path| path.relative_path_from(repo_path) }
      require_options = source_paths.map { |path| path }

      traverser = Mutant::Traverser.new
      classes = require_options.flat_map do |f|
        sexp = Parser::CurrentRuby.parse(File.read(f))
        traverser.classes(sexp)
      end.to_a.uniq

      options = %W[--include example/lib --require fibonacci --use rspec]
      pp ::Mutant::CLI.run(options + classes)
      []
    end

    private

    def test_path?(path)
      path.to_s.end_with?('_spec.rb')
    end
  end
end

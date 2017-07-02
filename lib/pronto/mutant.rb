# frozen_string_literal: true

require 'pronto'
require 'mutant'
require 'pp'

module Pronto
  class Mutant < Runner
    def initialize(patches, commit)
      super(patches, commit)
    end

    def run
      spec_path = repo_path + 'spec'
      source_paths = ruby_patches
                       .lazy
                       .map(&:new_file_full_path)
                       .select { |path| not_test_path?(path, spec_path) }
                       .map { |path| path.relative_path_from(repo_path) }
      require_options = source_paths.map { |path| }
      pp require_options
      # options = %w[--require ./lib/pronto/mutant.rb --use rspec Fibonacci]
      # pp ::Mutant::CLI.run(options)
      []
    end

    private

    def not_test_path?(path, spec_path)
      path.relative_path_from(spec_path).to_s.start_with?('..')
    end
  end
end

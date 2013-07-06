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
      @patches.each do |a|
        pathname = a.new_file_full_path
        pp pathname
      end
      options = %w[--require ./lib/pronto/mutant.rb --use rspec Pronto::Mutant]
      # pp ::Mutant::CLI.run(options)
      []
    end
  end
end

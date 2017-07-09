# frozen_string_literal: true

require 'yaml'

module Pronto
  class Mutant < ::Pronto::Runner
    class ConfigFile
      DEFAULT_MESSAGE_FORMAT = '%{msg}'

      EMPTY = {
        'require' => Set.new.freeze,
        'include' => Set.new(['lib']).freeze
      }.freeze

      def initialize(path = '.mutant.yml')
        @path = path
      end

      def to_h
        hash = File.exist?(@path) ? YAML.load_file(@path) : {}
        merge(hash)
      end

      private

      def merge(hash)
        {
          'require' => EMPTY['require'].union(hash.fetch('require', [])).to_a.freeze,
          'include' => EMPTY['include'].union(hash.fetch('include', [])).to_a.freeze,
        }
      end
    end
  end
end

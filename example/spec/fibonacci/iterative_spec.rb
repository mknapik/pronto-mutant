require_relative '../../lib/fibonacci/iterative'
require_relative '../support/fibonacci'

RSpec.describe Fibonacci::Iterative do
  subject { described_class.call(n) }

  it_behaves_like 'fibonacci'
end

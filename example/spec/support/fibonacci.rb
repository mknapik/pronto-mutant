# frozen_string_literal: true
RSpec.shared_examples 'fibonacci' do
  context 'when 0' do
    let(:n) { 0 }

    it { is_expected.to eq(1) }
  end

  context 'when 1' do
    let(:n) { 1 }

    it { is_expected.to eq(1) }
  end

  context 'when 2' do
    let(:n) { 2 }

    it { is_expected.to eq(2) }
  end

  context 'when 3' do
    let(:n) { 3 }

    it { is_expected.to eq(3) }
  end

  context 'when 6' do
    let(:n) { 6 }

    it { is_expected.to eq(13) }
  end

  context 'when 1.0' do
    let(:n) { 1.0 }

    it { is_expected.to eq(1.0) }
  end

  context 'when 10.0' do
    let(:n) { 6.0 }

    it { is_expected.to eq(13.0) }
  end
end

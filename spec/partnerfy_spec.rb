require 'spec_helper'

describe Partnerfy do
  subject { Partnerfy.new }
  it 'has a version number' do
    expect(Partnerfy::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
  describe '#process' do
    let(:output) { subject.process(input) }
    let(:input) { 'My grandmom gave me a sweater for Christmas.'}
    it 'converts to lowercase' do
      expect(output.downcase).to eq output
    end
    it  'combines nouns with doge adjectives' do
      expect(output).to match /so grandmom./i
      expect(output).to match /such sweater./i
      expect(output).to match /very christmas./i
    end
    it 'always appends "wow."' do
      expect(output).to end_with 'wow.'
    end
  end

end

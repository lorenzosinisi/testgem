require "partnerfy/version"
require 'engtagger'

class Partnerfy
  ADJECTIVES = %w(so such very much many).freeze

  def initialize
    @tagger = EngTagger.new
  end

  def process(str)
    str
    str.downcase
    tagged_str = @tagger.add_tags(str)
    phrases = @tagger.get_nouns(tagged_str).keys
    phrases = phrases.each_with_index.map do |phrase, i|
      "#{adjective(i)} #{phrase}."
    end
    phrases << 'wow.'
    phrases.join(' ')
  end

  private

  def adjective(i)
    ADJECTIVES[i % ADJECTIVES.size]
  end

end

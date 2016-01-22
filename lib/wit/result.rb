module Wit
  class Result
    attr_reader :id, :text, :intent, :confidence, :entities

    def initialize(hash)
      @id = hash['msg_id']
      @text = hash['_text']
      outcomes = hash['outcomes'].first
      if outcomes
        @intent = outcomes['intent']
        @confidence = outcomes['confidence']
        @entities = {}
        outcomes['entities'].each do |name, entity|
          @entities[name] = entity.map do |e|
            OpenStruct.new(e)
          end
        end
      end
    end
  end
end

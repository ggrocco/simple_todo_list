# frozen_string_literal: true

module FeedBuilders
  class Eager
    class Proxy
      def initialize(parent)
        @parent = parent
        @associations = {}
      end

      def load(association, id)
        @associations[association] = id
        @parent.load(association, id)
      end

      def get(association)
        @parent.get(association, @associations[association])
      end
    end

    def initialize
      @collector = Hash.new { |h, k| h[k] = [] }
      @results = Hash.new { |h, k| h[k] = klass_for(k).find(ids_for(k)) }
    end

    def proxy
      Proxy.new(self)
    end

    def load(association, id)
      @collector[association] << id
    end

    def get(association, id)
      @results[association].detect { |r| r.id == id }
    end

    private

    def klass_for(key)
      # :task => "task" => "Task" => Task
      key.to_s.classify.constantize
    end

    def ids_for(key)
      @collector[key]
    end
  end
end

# frozen_string_literal: true

class ListFeed < ApplicationRecord
  before_save :serialize_builder

  belongs_to :list

  serialize :instance_data, Hash

  attr_writer :builder

  def self.eager_build
    eager = FeedBuilders::Eager.new
    all.find_each { |l| l.builder.preload(eager.proxy) }
  end

  def serialize_builder
    self.instance_type = @builder.class.name.demodulize
    self.instance_data = @builder.data
  end

  def builder
    @builder ||= FeedBuilders.const_get(instance_type).new(instance_data)
  end
end

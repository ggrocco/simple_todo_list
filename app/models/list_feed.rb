class ListFeed < ActiveRecord::Base
  before_save :serialize_builder
  
  belongs_to :list
  
  serialize :instance_data, Hash
  
  attr_accessor :builder 

  def self.eager_build
    eager = FeedBuilders::Eager.new
    all.each{ |l| l.builder.preload(eager.proxy) }
  end

  def serialize_builder
    self.instance_type = @builder.class.name.demodulize
    self.instance_data = @builder.data
  end
  
  def builder
    @builder ||= FeedBuilders.const_get( self.instance_type ).new( self.instance_data )
  end
  
end


Dir[File.join(File.dirname(__FILE__), 'active_queue','*.rb')].each{|f| require f }

module ActiveQueue
  def self.adapters
    ActiveQueue::Adapters
  end
  module Adapters
    
  end
  Dir[File.join(File.dirname(__FILE__), 'active_queue', '*','*.rb')].each{|f| require f }
  class Queue
    
    if defined? Resque
      include ActiveQueue::Adapters::ResqueAdapter
    elsif defined? Delayed
      include ActiveQueue::Adapters::DelayedJobAdapter
    else
      include ActiveQueue::Adapters::DummyAdapter
    end
  end
  
end
ActiveQueue 
======

ActiveQueue is a Rails abstraction of queue configuration and background job creation/specification. 

Queues and Background Job Runners are becoming as ubiquitous to Rails applications as Databases. Why not treat each of them as the same generic component, conforming to an interface and convention that is well understood. 

Overview
--------
ActiveQueue allows you to create jobs and place them on whatever queue you have set as a requirement in
environment.rb. The first cut of this gem only supports DelayedJob and Resque. Background jobs can be any Ruby class or module that responds to perform. Your existing classes can easily be converted to background jobs or you can create new classes specifically to do work. Or, you can do both.

I place job classes withina Jobs module in models/jobs.rb and like so:

module Jobs
  class ExampleJob < Struct.new(:foo)
    def perform
      # perform magically delicious task
    end
  end
end

With ActiveQueue you can send any job to the configured queue like so

ActiveQueue::Queue.enqueue(Jobs::ExampleJob,'bar')


 
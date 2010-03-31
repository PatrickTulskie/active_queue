
module ResqueAdapter
  
    #Background jobs can be any Ruby class or module that responds to perform. 
    #Your existing classes can easily be converted to background jobs or 
    #you can create new classes specifically to do work. 
    #Or, you can do both.
    module ClassMethods
      def enqueue(job_runner_klass, options = { })
        Resque.enqueue(job_runner_klass, options)
      end
    end

end
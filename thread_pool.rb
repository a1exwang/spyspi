require 'thread'

# Thread Pool

# ThreadPool.new(n) : create a thread pool of n threads
# ThreadPool#add_resource : add a resource to the queue, thread safe
# ThreadPool#start_task(task) : task respond to call, it starts the thread pool
# ThreadPool#end_task

class ThreadPool
  def initialize(size = 8)
    @threads = size
    @queue = Queue.new
    @end_queue = Queue.new
  end
  def add_resource(res)
    @queue.enq res
  end
  def start_task(&task)
    @threads.times do
      Thread.new do
        loop do
          break if @end_queue.size > 0
          task.call self, @queue.deq
        end
        puts 'Site traversal done!'
      end
    end
  end
  def end_task
    @end_queue.enq '0'
  end
end
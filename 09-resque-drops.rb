# inside Resque.enqueue
queue.rpush("queue:urgent", payload)

# inside Resque::Worker#work
payload = queue.lpop("queue:urgent")
# time passes, hooks get called
# job initialized from payload
job.perform

#instead

# inside Resque.enqueue
queue.lpush("queue:urgent", payload)

# inside Resque::Worker#work
payload = queue.rpoplpush(
  "queue:urgent", "queue:urgent:preparing")
# time passes, stuff happens
queue.lrem("queue:urgent:preparing", 1, payload)
job.perform

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
  "queue:urgent", "backup-queue:urgent")
# time passes, stuff happens
queue.lrem("backup-queue:urgent", 1, payload)
job.perform

# Looking for feedback on: https://github.com/redsquirrel/resque
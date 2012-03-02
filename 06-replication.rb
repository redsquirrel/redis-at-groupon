require 'redis'

master = Redis.new

slave = Redis.new(:port => 6380)
slave.slaveof("localhost", 6379)

master.set("Hello", "World!")
p slave.get("Hello")
# nil OR "World!"
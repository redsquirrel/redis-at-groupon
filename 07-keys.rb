require 'redis'

redis = Redis.new
10_000_000.times do |i|
  # lots of Redis data inserted
end
p redis.keys.size #danger


#instead, use replication...
redis-server -
port 6380
^D
redis-cli -p 6380 slaveof localhost 6379
redis-cli -p 6380 keys "*" > /tmp/all_keys.txt
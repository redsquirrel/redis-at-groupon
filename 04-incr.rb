require 'redis'

redis = Redis.new
redis.set("deal-f62e89-sold", 0)
redis.incr("deal-f62e89-sold")
redis.incrby("deal-f62e89-sold", 5)
p redis.decr("deal-f62e89-sold")
# 5

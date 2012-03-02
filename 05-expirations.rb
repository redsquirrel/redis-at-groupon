require 'redis'

redis = Redis.new
redis.set("playing", "Halo")
redis.expire("playing", 15*60)
p redis.ttl("playing")
# 900
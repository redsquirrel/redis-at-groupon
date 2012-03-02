require 'redis'

redis = Redis.new
redis.lpush("daves", "hoover")
redis.lpush("daves", "chelimsky")
redis.lpush("daves", "thomas")
redis.rpop("daves")
redis.rpoplpush("daves", "davids")
redis.lpush("davids", "hansson")
p redis.lrange("davids", 0, -1)
# ["hansson", "chelimsky"]

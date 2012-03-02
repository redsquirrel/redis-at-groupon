require 'redis'

redis = Redis.new
redis.sadd("daves", "hoover")
redis.sadd("daves", "thomas")
p redis.sismember("daves", "hansson")
# false
redis.sadd("davids", "hansson")
redis.sadd("davids", "chelimsky")
p redis.sunion("daves", "davids")
# ["hoover", "thomas", "chelimsky", "hansson"]
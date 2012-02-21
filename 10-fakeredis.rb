require "fakeredis"

redis = Redis.new
redis.set("foo", "bar")
p redis.get("foo")

require "fakeredis/rspec"
# redis.flushdb before each example

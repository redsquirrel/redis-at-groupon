require "fakeredis"

redis = Redis.new
redis.set("foo", "bar")
p redis.get("foo")
# "bar"

require "fakeredis/rspec"
# redis.flushdb before each example

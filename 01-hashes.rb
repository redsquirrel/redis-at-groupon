require 'redis'

redis = Redis.new
dave = {
	:from     => "Seattle",
	:current  => "Chicago",
	:nickname => "redsquirrel",
	:initials => "dhh"
}
redis.hmset("dave", *dave.flatten)
redis.hset("dave", "current", "Bend")
p redis.hgetall("dave")
# {"from"=>"Seattle", "current"=>"Bend", "nickname"=>"redsquirrel", "initials"=>"dhh"}

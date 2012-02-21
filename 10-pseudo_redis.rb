class PseudoRedis
  def set(key, value)
    self[key] = value
  end

  def setex(key, expiration, value)
    self[key] = value
    expire(key, expiration)
  end

  def get(key)
    self[key]
  end
end
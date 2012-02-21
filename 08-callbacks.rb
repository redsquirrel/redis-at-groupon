class Post < ActiveRecord::Base
  def after_save # race condition
    Resque.enqueue(NotifyPeople, self.id)
  end
end

#instead

class Post < ActiveRecord::Base
  def after_commit
    Resque.enqueue(NotifyPeople, self.id)
  end
end

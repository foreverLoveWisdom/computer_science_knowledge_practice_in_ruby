# In a more informal interpretation,
# the principle states that parent instances should be replaceable with,
# one of their child instances without creating any unexpected or,
# incorrect behaviour.
# Therefore, LSP ensures that abstractions are correct,
# and helps developers achieve more reusable code
# and better organize class hierarchies.

# Violation of the LIskov Substitution Principle
class UserStatistic
  def initialize(user)
    @user = user
  end

  def posts
    @user.blog.posts
  end
end

# This child class completely different from the base class since it is trying to return
# a string, instead of an array
class AdminStatistic < UserStatistic
  def posts
    user_posts = super

    string = ""
    user_posts.each do |post|
      string += "title: #{post.title} author: #{post.author}\n" if post.popular?
    end

    string
  end
end

# This is the right way to do it
class UserStatistic
  def initialize(user)
    @user = user
  end

  def posts
    @user.blog.posts
  end
end

# The instance method post in AdminStatistic still returns array data type
# We have just isolated the business filter into another method(wrap it in
# an interface), this is just one of the many ways to follow LSP
class AdminStatistic < UserStatistic
  def posts
    user_posts = super
    user_posts.select { |post| post.popular? }
  end

  def formatted_posts
    posts.map { |post| "title: #{post.title} author: #{post.author}" }.join("\n")
  end
end

# The object of AdminStatistic can technically replace the object of UserStatistic
user_statistic = UserStatistic.new(user)
user.posts
admin_statistic = AdminStatistic.new(user)
admin_statistic.posts

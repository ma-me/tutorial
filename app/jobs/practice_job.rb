class PracticeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'yeah! gonna work background job!!'
    user = User.last
    user.update_attribute(:name, SecureRandom.alphanumeric(10))
  end
end

class User < ApplicationRecord
  has_many :tasks

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  def full_name
    "#{first_name} #{last_name}"
  end

  def due_today
    self.tasks.select { |task| task.due_date.to_date == DateTime.now.in_time_zone('UTC').to_date }
  end

end


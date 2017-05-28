class Trip < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: {message: "You cannot create a new trip without a assigning it a 'name'"}
end
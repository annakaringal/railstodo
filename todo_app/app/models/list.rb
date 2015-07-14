class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy #nice!
  belongs_to :user
end

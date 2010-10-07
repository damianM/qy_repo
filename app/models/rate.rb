class Rate < ActiveRecord::Base
  belongs_to :rateatable, :polymorphic => true
  belongs_to :user

  validates_presence_of :value
  validates_inclusion_of :value, :in => [1, 2, 3, 4, 5]
end

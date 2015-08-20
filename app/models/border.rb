class Border < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :content, presence: true, length: {maximum: 140}
	validates :title, presence: true
end

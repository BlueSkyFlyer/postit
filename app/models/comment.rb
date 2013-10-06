class Comment < ActiveRecord::Base
	belongs_to :creator
	belongs_to :post
end
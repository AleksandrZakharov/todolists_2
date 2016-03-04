class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy
	has_many :todo_lists, dependent: :destroy
	has_many :todo_items, through: :todo_lists, source: :todo_items

	validates :username, presence: true
	def get_completed_count
		@@counter = 0
		self.todo_lists.all.each {|l|
			l.todo_items.all.each{|i|
				if i.completed == true
					@@counter += 1
				end
			}

		}
		return @@counter
	end

end

User.destroy_all

User.create! [
	{username: "Fiorina", password_digest: "abc123"},
	{username: "Trump", password_digest: "123abc"},
	{username: "Carson", password_digest: "not_telling"},
	{username: "Clinton", password_digest: "password1"},
]

User.find_by!(username: "Fiorina").create_profile(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina")
User.find_by!(username: "Trump").create_profile(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump")
User.find_by!(username: "Carson").create_profile(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson")
User.find_by!(username: "Clinton").create_profile(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton")



User.all.each { |u| 
	u.todo_lists.create!(list_name: "#{u.username}", list_due_date: Date.today + 1.year)
	u.todo_lists.all.each { |l|
		for i in 1..5
			l.todo_items.create!(due_date: Date.today + 1.year, title: "#{l.list_name}" + " #{i}", description: " #{i}" + "#{l.list_name}", completed: "false")
		end
	}
}
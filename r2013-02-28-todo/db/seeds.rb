User.delete_all
Task.delete_all
Priority.delete_all

u1 = User.create(:name => 'Bob', :email => 'bob@example.com', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:name => 'Joe', :email => 'joe@example.com', :password => 'a', :password_confirmation => 'a')
u3 = User.create(:name => 'Tim', :email => 'tim@example.com', :password => 'a', :password_confirmation => 'a')

t1 = Task.create(:address => '10 East 21st Street NYC', :title => 'Breakfast', :description => 'Eat breakfast.', :duedate => '2013/04/01')
t2 = Task.create(:address => 'Paris, France', :title => 'Lunch', :description => 'Eat lunch.', :duedate => '2013/05/01')
t3 = Task.create(:address => 'London, England', :title => 'Dinner', :description => 'Eat dinner.', :duedate => '2013/06/01')

p1 = Priority.create(:name => 'Low', :color => '#0000FF', :value => 1)
p2 = Priority.create(:name => 'Medium', :color => '#00FF00', :value => 2)
p3 = Priority.create(:name => 'High', :color => '#FF0000', :value => 3)

t1.priority = p1
t1.save
t2.priority = p2
t2.save
t3.priority = p3
t3.save

u1.priorities << p1 << p2 << p3
u1.tasks << t1 << t2 << t3
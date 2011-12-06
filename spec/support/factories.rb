Factory.define :user do |u|
  u.email 'tester@test.com'
  u.username 'tester'
  u.password 'abcd1234'
  u.lists { [Factory.build(:list), Factory.build(:list_private) ] }
  u.after_build { |u| u.lists.each{ |l| l.owner = u } }
end

Factory.define :list do |l|
  l.name 'My public list'
  l.private false
  l.tasks { [ Factory.build(:task), Factory.build(:task), Factory.build(:task)  ] }
end

Factory.define :list_private, :class => List do |l|
  l.name 'My private list'
  l.private true
  l.tasks { [ Factory.build(:task) ] }
end

Factory.define :other_user, :class => User do |u|  
  u.sequence(:email) { |n| "other_user#{n}@test.com" }
  u.sequence(:username) { |n| "other_user#{n}" }
  u.password 'abcd1234'
  u.lists { [Factory.build(:other_list) ] }
  u.after_build { |u| u.lists.each{ |l| l.owner = u } }
end

Factory.define :other_list, :class => List do |l|
  l.name 'Other public list'
  l.private false
  l.tasks { [ Factory.build(:task) ] }
end

Factory.define :task do |t|
  t.todo 'Do something'
end
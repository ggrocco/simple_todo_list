Factory.define :user do |u|
  u.email 'tester@test.com'
  u.username 'tester'
  u.password 'abcd1234'
  u.lists { [ Factory.build(:list) ] }
end

Factory.define :list do |l|
  l.name 'My list'
  l.private false
  l.tasks { [ Factory.build(:task) ] }
end

Factory.define :task do |t|
  t.todo 'Do something'
end
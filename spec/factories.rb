# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username(specifier: 5..25, separators: ['_']) }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }

    trait :with_favorites do
      favorites { [create(:user).lists.first] }
    end

    trait :with_list do
      after(:build) do |user|
        user.lists = [build(:list, owner: user), build(:list, :private, owner: user)]
      end
    end

    trait :with_list_with_task do
      after(:build) do |user|
        user.lists = [build(:list, :with_task, owner: user), build(:list, :private, :with_task, owner: user)]
      end
    end
  end

  factory :list do
    name { Faker::Lorem.sentence(word_count: 3) }
    association :owner, factory: :user
    private { false }

    trait :private do
      private { true }
    end

    trait :with_task do
      tasks { [build(:task), build(:task), build(:task)] }
    end
  end

  # factory :other_list, class: 'List' do
  #   name { 'Other public list' }
  #   private { false }
  #   tasks { [build(:task)] }

  #   after(:create) do |list|
  #     list.list_feeds.create(builder: FeedBuilders::TaskDone.new(task_id: list.id))
  #   end
  # end

  factory :task do
    todo { Faker::Lorem.sentence(word_count: 3) }
  end
end

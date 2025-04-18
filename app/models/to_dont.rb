class ToDont < ApplicationRecord
    belongs_to :user
    validates :task, presence: true
    attribute :completed, :boolean, default: false
end

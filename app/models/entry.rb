class Entry < ApplicationRecord
  validates :title, presence: true

  belongs_to :user, optional: true
end

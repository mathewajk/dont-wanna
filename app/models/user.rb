class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :to_donts, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true, 
    format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: "must be a valid email address" }

  validates :password, presence: true, length: { minimum: 8, maximum: 128 }

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  class << self
  def send_digest
      User.all.each do |user|
        UserMailer.has_todos(user).deliver_now
      end
    end
  end

end

class User < ApplicationRecord
  has_many :orders
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/, message: "is invalid"}
  validates :phone_number, format: {with: /\A[+]?(\d){9,12}+\z/, message: "is invalid, must contains only numbers (between 9 and 12). Could it start with '+'"}
  validates :password, format: {with: /[0-9a-zA-Z]/, message: "is invalid, must contains only alphanumerics characters"}, length: {in: 8..12, message: "must be in range between 8 and 12 characters"}
end
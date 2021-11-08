class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :devices
  has_many :orders
  has_many :invoices, through: :order
  
  def admin?
    role == 'admin'
  end
  def operator?
    role == 'operator'
  end
  def user?
    role == 'user'
  end
end

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

  def ingresos
    sum = 0
    orders.each do |order|
      sum = sum +1
    end
    sum
  end
  
  def egresos
    sum = 0
    orders.each do |order|
      if order.date_out != nil
        sum = sum +1
      end
    end
    sum
  end

  
  
end

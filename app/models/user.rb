class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
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

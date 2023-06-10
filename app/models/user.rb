class User < ApplicationRecord
  has_many :tweets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true #Esto es para asegurar que haya la presencia de esto y no chingar la base de datos
  validates :last_name, presence: true
  def full_name
    "#{first_name} #{last_name}"
  end
end

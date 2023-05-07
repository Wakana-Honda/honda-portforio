class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # with_options presence: true do
  # validates :email, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # validates :password, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # end
  
  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  # validates :password, format: { with: VALID_PASSWORD_REGEX,
  #     message: '半角英数字で入力して下さい' }
         
  has_many :records, dependent: :destroy
  has_many :pets, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :types, dependent: :destroy
 
end

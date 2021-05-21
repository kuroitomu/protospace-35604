class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,       presence: true
  validates :profile,    presence: true
  validates :occupation, presence: true
  validates :position,   presence: true

  has_many         :comments
  has_many         :messages
  has_many         :prototypes
  has_many         :comments
  has_one_attached                 :image
  has_many :room_users, dependent: :destroy
  has_many :messages, dependent:   :destroy

end

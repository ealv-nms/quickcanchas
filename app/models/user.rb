# frozen_string_literal: true

# usser
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_reservas
  has_many :reservas, through: :user_reservas, dependent: :delete_all
  has_many :resenas, dependent: :delete_all

  # has_one_attached :profile_picture

  enum role: %i[user moderador pending]
  has_many :reclamos, dependent: :delete_all
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    role || :user
  end

  def is_mod
    role == 'moderador'
  end
end

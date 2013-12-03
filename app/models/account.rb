class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profile, polymorphic: true

  accepts_nested_attributes_for :profile, :allow_destroy => true
  
  validates_presence_of :profile

  def has_role? role
    role.to_sym == :customer
  end

  def build_profile profile
    self.profile = Kernel.const_get(profile.delete(:type)).new profile
  end

end
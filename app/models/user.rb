class User < ActiveRecord::Base
  has_many :link_collections
  after_destroy :destroy_orphaned_link_collections
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  private
  
  def destroy_orphaned_link_collections
    link_collections.each do |link_collection|
      link_collection.destroy if !link_collection.user
    end
  end
end

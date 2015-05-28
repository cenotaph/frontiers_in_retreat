class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :site
  belongs_to :artist
  accepts_nested_attributes_for :roles


   def active_for_authentication? 
     super && approved? 
   end 

   def inactive_message 
     if !approved? 
       :not_approved 
     else 
       super # Use whatever other message 
     end 
   end
         
end

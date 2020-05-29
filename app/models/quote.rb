class Quote < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :book, optional: true


  #def user_attributes=(user_attributes)
  #  self.user = User.find_or_create_by(username: user_attributes[:username]) unless #user_attributes[:username].blank?
  #end

end

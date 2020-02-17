# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  
  def comments
    return Comment.where({ :author_id => self.id })
  end

  def commented_venues
    venue_ids = self.comments.pluck(:venue_id)
    return Venue.where({ :id => venue_ids }).distinct
  end
end

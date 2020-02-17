class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.author_id = params.fetch("input_author_id")
    comment.venue_id = params.fetch("input_venue_id")
    comment.body = params.fetch("input_body")
    comment.save
    
    redirect_to("/venues/#{comment.venue_id}")
  end
end

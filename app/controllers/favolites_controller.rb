class FavolitesController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    favolite = current_user.favolites.new(post_image_id: post_image.id)
    favolite.save
    redirect_to post_image_path(post_image)
  end

  def destory
    post_image = PostImage.find(param[:post_image_id])
    favolite = current_user.favolites.find_by(post_image_id: post_image.id)
    favolite.destroy
    redirect_to post_image_path(post_image)
  end

end

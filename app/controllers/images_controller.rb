class ImagesController < ApplicationController
  def ogp
    text = ogp_params[:text]
    from = ogp_params[:from]
    to = ogp_params[:to]
    OgpCreator.build(text)
    image = OgpCreator.write2(from, to) #.tempfile.open.read
    @photo = Photo.new(image: image)
    @photo.save
    send_data image, :type => 'image/png',:disposition => 'inline'
  end

  def ogp_params
    params.permit(:text, :from, :to)
  end
end

module ImagesHelper
  def og_image(path)
    if path
      provide(:image, path)
    else
      provide(:image, 'favicon.ico')
    end
  end
end

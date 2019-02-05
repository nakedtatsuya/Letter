module ImagesHelper
  def og_image(path)
    if path
      provide(:image, path)
    else
      provide(:image, 'icon.png')
    end
  end
end

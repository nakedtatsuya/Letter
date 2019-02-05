class OgpCreator
  require 'mini_magick'
  BASE_IMAGE_PATH = './app/assets/images/LetterTemplate.png'
  GRAVITY = 'center'
  TEXT_POSITION = '0,0'
  FROM_POSITION = '150,350'
  TO_POSITION = '-150,-300'
  FONT = './app/assets/fonts/HuiFont.ttf'
  FONT_SIZE = 32
  BODY_FONT_SIZE = 18
  INDENTION_COUNT = 18
  ROW_LIMIT = 16

  def self.build(text)
    text = prepare_text(text)
    @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    configuration1(text)
  end

  def self.from_build(text)
    text = prepare_text(text)
    from_configuration(text)
  end

  def self.to_build(text)
    text = prepare_text(text)
    to_configuration(text)
  end

  def self.write2(from, to)
    from_build(from)
    to_build(to)
    return @image
  end

  private
  def self.prepare_text(text)
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end

  def self.configuration1(text)
    @image.combine_options do |config|
      config.font FONT
      config.fill 'black'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
  end
  #from
  def self.from_configuration(text)
    @image.combine_options do |config|
      config.font FONT
      config.fill 'black'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{FROM_POSITION} '#{text}'"
    end
  end

  #to
  def self.to_configuration(text)
    @image.combine_options do |config|
      config.font FONT
      config.fill 'black'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TO_POSITION} '#{text}'"
    end
  end
end
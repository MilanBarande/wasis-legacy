class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick # <- Notice this

  storage :fog                    # <- and this

  def store_dir
    "workoasis/#{model.class.to_s}"
  end

end

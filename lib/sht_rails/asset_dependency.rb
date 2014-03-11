module ShtRails
  class AssetDependency
    def initialize(path)
      @path = path
    end

    def source
      asset = Rails.application.assets.find_asset(@path)

      asset.source unless asset.nil?
    end
  end
end
module ShtRails
  class ContentDependency
    def initialize(content)
      @content = content
    end

    def source
      @content
    end
  end
end
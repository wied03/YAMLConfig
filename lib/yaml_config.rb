module BW
  class YAMLConfig
    attr_accessor :props

    def initialize defaultfile = "local_properties_default.yml",
                   userfile = "local_properties.yml"
        default_props = YAML::load(File.read(defaultfile))
        FileUtils.touch userfile unless File.exists? userfile
        user_props = YAML::load(File.read(userfile))
        @props = merge user_props, default_props
    end

    private

    def merge(user, default)
      return default unless user
      return user unless user.is_a?(Hash)
      default.each do |key, defaultvalue|
          if user.has_key? key
              userval = user[key]
              user[key] = merge(userval, defaultvalue)
          else
              user[key] = defaultvalue
          end
      end
      user
    end
  end
end
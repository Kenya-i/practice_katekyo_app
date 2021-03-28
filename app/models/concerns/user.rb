require 'active_support'

module User
  extend ActiveSupport::Concern
  
  included do
    def hoge
      puts "hogehogeですよ"
    end
  end
end

module Robserve
  class << self

    def connect(connection_string)
      Sequel.connect(connection_string)
    end

  end
end

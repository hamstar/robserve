module Robserve
  class Device < Sequel::Model(:devices)

    set_primary_key [:device_id]

    def up? 
      status == 1
    end

    def ignore?
      ignore == 1
    end

    def enable_unix_agent
      
      attribs = DB[:devices_attribs]
      values = { 
        :device_id => 1, 
        :attrib_type => "poll_unix-agent", 
        :attrib_value => 1
      }

      # Get out if the polling is already enabled
      return if attribs.where( values ).count == 1

      # polling was disabled... enable it
      attribs.insert( values )
    end
  end
end

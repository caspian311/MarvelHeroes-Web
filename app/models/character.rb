class Character < ActiveRecord::Base
  serialize :body, JSON
end


require 'rubygems'
require 'mongoid'

class MiracleQuestion
  include Mongoid::Document
  store_in :miraclequestions
  field :ownerName, :type => String
  field :text, :type => String
  field :xpos, :type => String
  field :ypos, :type => String
  field :taskId, :type => String
  field :id, :type => String
end
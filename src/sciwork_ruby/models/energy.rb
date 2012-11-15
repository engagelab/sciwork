# Class used to hold bookmarking logic
require 'rubygems'
require 'mongoid'

class EnergySource
  include Mongoid::Document
  store_in :miracleenergy
  field :energy, :type => String
  field :inuse, :type => Boolean
  field :token, :type => String
  field :id, :type => String
end

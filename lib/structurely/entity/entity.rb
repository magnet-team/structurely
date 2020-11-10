# frozen_string_literal: true

Gem.find_files("client/**/*.rb").each { |path| require path }

module Structurely
  # Entities represent objects existing in Structurely
  #
  # Typically, Entities inherit class methods from {Client} instance methods
  # @see Client
  module Entity
    # @abstract
    class Entity < ApiStruct::Entity
      include Client
    end
  end

  include Entity
end

# frozen_string_literal: true

Pry.config.prompt = Pry::Prompt[:rails][:value]

require 'awesome_print'
AwesomePrint.pry!

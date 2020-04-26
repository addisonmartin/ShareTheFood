# frozen_string_literal: true

# Configures the Pry prompt to append the Rail's environment and project name.
Pry.config.prompt = Pry::Prompt[:rails][:value]

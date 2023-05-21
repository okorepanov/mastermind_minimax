# frozen_string_literal: true

# Libraries
require 'optparse'
require 'byebug'

# Game variants
Dir['./models/games/*.rb'].each {|file| require file }

# Default game
game = Games::ShowGame

# CLI options
OptionParser.new do |opts|
  opts.banner = "Usage: script.rb [options]"

  opts.on("--code-maker", "Start game as a code-maker") do
    game = Games::UserCodeMakerGame
  end

  opts.on("--code-breaker", "Start game as a code-maker") do
    game = Games::UserCodeBreakerGame
  end

  opts.on("--show-game", "Start endless loop, where implementation of Minimax algorithm is showed") do
    game = Games::ShowGame
  end

  opts.on("--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

# Game start
begin
  game.run
rescue Interrupt
  puts 'Game is ended!'
end

# frozen_string_literal: true

my_l = lambda { puts 'hi!' } # rubocop:disable Style/Lambda
my_l.call

my_l2 = -> { puts 'thin arrow' }
my_l2.call

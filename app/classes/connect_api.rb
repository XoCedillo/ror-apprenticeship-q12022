# frozen_string_literal: true

require 'httparty'

# Class conection for Pokiapi
class ConnectApi
  include HTTParty

  attr_accessor :pokedata, :fields

  base_uri 'https://pokeapi.co/api/v2'

  START_OFFSET = 0
  QUERY_TYPE = %w[limit_offset pokeid name].freeze

  def initialize(pokedata, fields)
    @pokedata = pokedata
    @count = count_all(pokedata)
    @fields = fields
    create_methods
  rescue Net::OpenTimeout => e
    puts "Conection was not possible, couldn't initialize: #{e}"
    nil
  end

  # endpoints
  # query of all <pokedata>
  # query of <pokedata> by <parameter>
  # ------------------------------------------
  # where <pokedata> could be pokemon, ability, type, etc .. input
  # where <parameter> could be limit, offset, pokeid(by url), name
  # note: limit, offset can be used combined
  def create_methods
    QUERY_TYPE.each do |param|
      self.class.define_method("query_#{@pokedata}_by_#{param}".to_sym) do |data|
        return self.class.get("/#{@pokedata}?limit=#{data[0]}&offset=#{data[0]}").to_h if param == :limit_offset

        self.class.get("/#{@pokedata}/#{data}").to_h
      end
    end
  end

  def call
    list = []
    hash = {}
    results = self.class.get("/#{@pokedata}?limit=#{@count}}&#{START_OFFSET}=0")['results']
    results.each do |entry|
      hash[:poke_id] = entry['url'][%r{/\d{1,}/}].sub(%r{/}, '').chomp('/')
      query = self.class.get("/#{@pokedata}/#{hash[:poke_id]}")
      @fields.each do |field|
        hash[field.to_sym] = query[field.to_s]
      end
      p hash
      list.append(hash)
    end
    list
  end

  private

  def count_all(pokedata)
    response = self.class.get("/#{pokedata}")
    response['count']
  end
end

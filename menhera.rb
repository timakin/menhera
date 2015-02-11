#!/bin/env ruby
#encoding:UTF-8
require "twitter"
require "yahoo_keyphrase_api"
require "sentimental"
# Twitter Access Token Setting
@client = Twitter::REST::Client.new do |config|
  config.consumer_key = "DLEpbDnir0fbjRAGb4Ehs3zCS"
  config.consumer_secret = "gvV1QYwxG1d4W5SuxSQqN3LPbNIRdPKq2uk4tAtxqjFjkr42NE"
  config.access_token = "798018066-tNYePD4K711EWDY22AF8w7B46ufGicTYDaj49Gdy"
  config.access_token_secret = "sBPyVFCaqqA1sInLBdXoFUl12QeiQz5RLeUSldSIs36Ec"
end

def word_search_result(target="")
  return_text=[]
  @client.search(target, :result_type => "recent").take(200).each do |tweet|
    return_text<<tweet.text
  end
  return return_text
end

Sentimental.load_defaults
analyzer = Sentimental.new
menhera_text = word_search_result("mental illness")
menhera_text.each do |m|
  print "\n"
  print(m)
  print "\n"
  print(analyzer.get_score (m))
  print "\n"
end

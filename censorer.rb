test_tweets = [
  "This president sucks!",
  "I hate this Blank House!",
  "I can't believe we're living under such bad leadership. We were so foolish",
  "President Presidentname is a danger to society. I hate that he's so bad – it sucks."
  ]

banned_president_phrases = ["sucks", "bad", "hate", "foolish", "danger to society"]
banned_people_phrases = ["loser", "dumb", "Presidentname"]


# program that filters out negative words - banned phrases
# replace each word filtered out with CENSORED

def censor(tweet, list_of_phrases)
  list_of_phrases.each { |phrase| tweet.gsub! phrase, "CENSORED" }
  puts tweet
end

censor(test_tweets.sample, banned_president_phrases)
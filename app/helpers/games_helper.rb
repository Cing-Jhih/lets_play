module GamesHelper
  def render_with_hashtags(step)
    step.gsub(/#\w+/){|word| link_to word, "/games/hashtag/#{word.delete('#')}"}.html_safe
  end
end

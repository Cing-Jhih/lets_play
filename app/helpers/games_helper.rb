module GamesHelper
  def render_with_hashtags(step)
    step.encode("utf-8").gsub(/#[\u4e00-\u9fa5_a-zA-Z0-9]+/){|word| link_to word, "/games/hashtag/#{word.delete('#')}"}.html_safe
  end
end

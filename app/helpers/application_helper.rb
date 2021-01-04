module ApplicationHelper
  def time_ago_in_locale(time)
    time_ago_in_words(time) + t('time.ago')
  end
end

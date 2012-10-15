class ArticleObserver < ActiveRecord::Observer
  
  def after_create(article)
      Activity.add(article.user_id, Activity::ARTICLE_ADDED, article)
  end
  
end

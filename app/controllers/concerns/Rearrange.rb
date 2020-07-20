module Rearrange
  extend ActiveSupport::Concern

  def article_rearrange(selection, order)
    @articles = []
    case selection
    when "like"
      sort_articles = Article.find(Favorite.group(:article_id).order('count(article_id) desc').pluck(:article_id))
    when "bookmark"
      sort_articles = Article.find(Bookmark.group(:article_id).order('count(article_id) desc').pluck(:article_id))
    end
    sort_articles.each do |sort_article|
      @search_articles.each do |article|
        if article.id == sort_article.id
          @articles.append(article)
        end
      end
    end
    case order
    when "Descending"
      @articles.push(@search_articles).flatten!.uniq!
    when "Ascending"
      @articles.push(@search_articles).flatten!.uniq!.reverse!
    end
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(5)
  end

  def question_rearrange(selection, order)
    @questions = []
    case selection
    when "response"
      sort_questions = Question.find(Response.group(:question_id).order('count(question_id) desc').pluck(:question_id))
      sort_questions.each do |sort_question|
        @search_questions.each do |question|
          if question.id == sort_question.id
            @questions.append(question)
          end
        end
      end
    end
    case order
    when "Descending"
      @questions.push(@search_questions).flatten!.uniq!
    when "Ascending"
      @questions.push(@search_questions).flatten!.uniq!.reverse!
    end
    @questions = Kaminari.paginate_array(@questions).page(params[:page]).per(5)
  end

  def question_collect
    @questions_id = []
    @search_questions.each do |question|
      @questions_id.append(question.id)
    end
  end
end

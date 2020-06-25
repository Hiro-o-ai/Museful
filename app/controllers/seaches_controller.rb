class SeachesController < ApplicationController
  def top
  end
  
  def search
    @article_or_question = params[:option]
    search = params[:search]
    session[:search] = search
    if @article_or_question == "記事"
      @articles = Article.search(search, @article_or_question).page(params[:page]).per(5)
    else
      @questions = Question.search(search, @article_or_question).page(params[:page]).per(5)
    end
  end

  def article_sort
    search = session[:search]
    articles = Article.search(search, "記事")
    selection = params[:keyword]
    case selection
      when "new"
        @articles = articles.order(created_at: :desc).page(params[:page]).per(5)
      when "old"
        @articles = articles.order(created_at: :asc).page(params[:page]).per(5)
      when 'likes'
        sort_articles = Article.find(Favorite.group(:article_id).order('count(article_id) desc').pluck(:article_id))
        @articles = []
        sort_articles.each do |sort_article|
          articles.each do |article|
            if article.id == sort_article.id
              @articles.append(article)
            end
          end
        end
        @articles.push(articles).flatten!.uniq!
        @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(5)
      when 'dislikes'
        sort_articles = Article.find(Favorite.group(:article_id).order('count(article_id) desc').pluck(:article_id))
        @articles = []
        sort_articles.each do |sort_article|
          articles.each do |article|
            if article.id == sort_article.id
              @articles.append(article)
            end
          end
        end
        @articles.push(articles).flatten!.uniq!.reverse!
        @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(5)
      when "bookmarks"
        sort_articles = Article.find(Bookmark.group(:article_id).order('count(article_id) desc').pluck(:article_id))
        @articles = []
        sort_articles.each do |sort_article|
          articles.each do |article|
            if article.id == sort_article.id
              @articles.append(article)
            end
          end
        end
        @articles.push(articles).flatten!.uniq!
        @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(5)
      when 'disbookmarks'
        sort_articles = Article.find(Bookmark.group(:article_id).order('count(article_id) desc').pluck(:article_id))
        @articles = []
        sort_articles.each do |sort_article|
          articles.each do |article|
            if article.id == sort_article.id
              @articles.append(article)
            end
          end
        end
        @articles.push(articles).flatten!.uniq!.reverse!
        @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(5)
      when "rates"
        @articles = articles.order(avarage_rate: :desc).page(params[:page]).per(5)
      when 'disrates'
        @articles = articles.order(avarage_rate: :asc).page(params[:page]).per(5)
    end
    @article_or_question = "記事"
    render "search"
  end

  def question_sort
    search = session[:search]
    questions = Question.search(search, "質問")
    selection = params[:keyword]
    case selection
      when "new"
        @questions = questions.order(created_at: :desc).page(params[:page]).per(5)
      when "old"
        @questions = questions.order(created_at: :asc).page(params[:page]).per(5)
      when 'responses'
        sort_questions = Question.find(Response.group(:question_id).order('count(question_id) desc').pluck(:question_id))
        @questions = []
        sort_questions.each do |sort_question|
          questions.each do |question|
            if question.id == sort_question.id
              @questions.append(question)
            end
          end
        end
        @questions.push(questions).flatten!.uniq!
        @questions = Kaminari.paginate_array(@questions).page(params[:page]).per(5)
      when 'disresponses'
        sort_questions = Question.find(Response.group(:question_id).order('count(question_id) desc').pluck(:question_id))
        @questions = []
        sort_questions.each do |sort_question|
          questions.each do |question|
            if question.id == sort_question.id
              @questions.append(question)
            end
          end
        end
        @questions.push(questions).flatten!.uniq!.reverse!
        @questions = Kaminari.paginate_array(@questions).page(params[:page]).per(5)
      when "unsolve"
        questions_id = []
        questions.each do |question|
          questions_id.append(question.id)
        end
        @questions = Question.where(id:questions_id,status: "回答受付中").page(params[:page]).per(5)
      when 'solve'
        questions_id = []
        questions.each do |question|
          questions_id.append(question.id)
        end
        @questions = Question.where(id:questions_id,status: "解決済み").page(params[:page]).per(5)
    end
    @article_or_question = "質問"
    render "search"
  end

end

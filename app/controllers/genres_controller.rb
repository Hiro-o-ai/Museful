class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @articles = @genre.articles
    @questions = @genre.questions
  end

  def narrow_article
    @genre = Genre.find(params[:genre_id])
    articles = @genre.articles
    search = params[:search]
    search_articles = Article.search(search, "記事")
    @articles = []
    search_articles.each do |search_article|
      articles.each do |article|
        if article.id == search_article.id
          @articles.append(article)
        end
      end
    end
    render "show"
  end

  def narrow_question
    @genre = Genre.find(params[:genre_id])
    questions = @genre.questions
    search = params[:search]
    search_questions = Question.search(search, "質問")
    @questions = []
    search_questions.each do |search_question|
      questions.each do |question|
        if question.id == search_question.id
          @questions.append(question)
        end
      end
    end
    render "show"
  end

end

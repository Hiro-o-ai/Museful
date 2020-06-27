crumb :root do
  link "トップページ", root_path
end

crumb :user do |user|
  link "マイページ", user_path(user)
end

crumb :edit_user do |user|
  link "プロフィール編集", edit_user_path(user)
  parent :user, user
end

crumb :leave_user do |user|
  link "プロフィール編集", user_leave_path(user)
  parent :edit_user, user
end

crumb :nitification do
  link "通知", notifications_path
end

crumb :search do
  link "検索", search_path
end

crumb :search_result do
  link "検索結果", search_result_path
  parent :search
end

crumb :genre_search do |genre|
  link "ジャンル検索", genre_path(genre)
  parent :search
end

crumb :articles do
  link "記事一覧", articles_path
end

crumb :new_article do
  link "記事投稿", new_article_path
  parent :articles
end

crumb :article do |article|
  link "記事詳細", article_path(article)
  parent :articles
end

crumb :edit_article do |article|
  link "記事編集", edit_article_path(article)
  parent :article, article
end

crumb :questions do
  link "質問一覧", questions_path
end

crumb :new_question do
  link "質問投稿", new_question_path
  parent :questions
end

crumb :question do |question|
  link "質問詳細", question_path(question)
  parent :questions
end

crumb :edit_question do |question|
  link "質問編集", edit_question_path(question)
  parent :question, question
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
module ApplicationHelper
  def form_title
     current_page?(new_group_path) ? "新規チャットグループ作成" : "チャットグループ編集"
  end
end

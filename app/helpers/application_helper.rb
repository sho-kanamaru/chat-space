module ApplicationHelper
  def form_title
    if current_page?(new_group_path)
      return "新規チャットグループ作成"
    else
      return "チャットグループ編集"
    end
  end
end

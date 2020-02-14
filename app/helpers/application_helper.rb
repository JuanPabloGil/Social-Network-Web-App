module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def request_friend_btn(user)
    friend_request_exist = Friendship.find_by(user_id: current_user.id, friend_id: user.id)

    if friend_request_exist
      if friend_request_exist.confirmed == true
        link_to('Delete Friend', delete_friend_path(user_id: current_user.id, friend_id: user.id), method: :post)
      else
        'Pending request...'
      end

    elsif current_user.id != user.id
      link_to('Request Friendship', user_friendships_path(user_id: current_user.id, friend_id: user.id), method: :post)

    end
  end

  def accept_friend_btn(user)
    link_to('Acept friend', acept_friend_path(user_id: current_user.id, friend_id: user.id))
  end

  def notifications
    if current_user.friend_requests.size >= 1
      current_user.friend_requests.size
    else
      '0'
    end
  end
end

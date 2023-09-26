class CommentsMailer < ApplicationMailer
  def comment_added(comment, user)
    @user = user
    @post = comment.post

    mail(
      to: "#{@user.full_name} <#{@user.email}>",
      subject: "New post comment"
    )
  end
end

# Usage
# Email will be sent later
# CommentsMailer.comment_added(Comment.last, User.first).deliver_later

# Email will be sent in 5 days
# CommentsMailer.comment_added(Comment.last, User.first).deliver_later(wait_until: 5.days.from_now)

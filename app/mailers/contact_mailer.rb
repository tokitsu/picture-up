class ContactMailer < ApplicationMailer
    def contact_mail(blog)
      @blog = blog

      mail to: @blog.user.email, subject: "写真投稿の確認メール"
    end

end

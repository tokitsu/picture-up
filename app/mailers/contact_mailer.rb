class ContactMailer < ApplicationMailer
    def contact_mail(contact)
      @contact = contact

      mail to: @user.email, subject: "写真投稿の確認メール"
    end

end

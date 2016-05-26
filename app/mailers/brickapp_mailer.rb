class BrickappMailer < ApplicationMailer
  def review_email(work, supplier, fixes, user)
    @work = work
    @supplier = supplier
    @fixes = fixes
    @user = user
    mail(to: @supplier.email, subject: "Fix list for #{@work.name}", cc: @user.email)
  end
end

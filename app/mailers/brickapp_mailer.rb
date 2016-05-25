class BrickappMailer < ApplicationMailer
  def review_email(work)
    @work = work
    mail(to: "ironbuild.mail@gmail.com", subject: "Work completed")
  end
end

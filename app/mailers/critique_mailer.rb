class CritiqueMailer < ActionMailer::Base
  default from: "criticalens.notifications@gmail.com"

  def critique_notification(critique_id)
    @critique = Critique.find(critique_id)
    @photo_owner = User.find(Photo.where(fid: @critique.fid).first.user_id)
    mail(to: @photo_owner.email , subject: "You received a new critique!")
  end

end

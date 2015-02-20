class EmailJob
  @queue = :email
  def self.perform(critique_id)
    CritiqueMailer.critique_notification(critique_id).deliver
  end
end

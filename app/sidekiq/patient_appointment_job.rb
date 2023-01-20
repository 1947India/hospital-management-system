class PatientAppointmentJob
  #include Sidekiq::Job
#  queue_as :default
  # sidekiq_options retry: false
  sidekiq_options queue: :default, retry: false, backtrace: true
  def perform(object)
    CrudNotifictionMailer.Create_notifiction(object).deliver_now
  end
end

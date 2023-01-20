class PatientAppointmentsController < ApplicationController
def index
    @patient_appointments = current_user.patient_appointments
  end
  def new
    @patient_appointment = PatientAppointment.new
  end

  def create
  
    @patient_appointment = PatientAppointment.new(patient_appointment_params)
    @patient_appointment.user_id = current_user.id
    if @patient_appointment.save
      CrudNotifictionMailer.Create_notifiction(@patient_appointment).deliver_now
       #PatientAppointmentJob.perform_in(1.minutes,@patient_appointment)
       

      #  redirect_to admin_patient_appointments
      #redirect_to root_path
    else
      redirect_to root_path  
    end
  end
private
  def patient_appointment_params
    params.require(:patient_appointment).permit(:appointment_date, :slot_time, :doctor_id, :patient_id)
  end
end
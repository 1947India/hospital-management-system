ActiveAdmin.register PatientAppointment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :appointment_date, :slot_time, :doctor_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:appointment_date, :slot_time, :doctor_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form do |f|
    input :appointment_date
    input :slot_time
    input :doctor_id
    input :user_id
    f.submit
   end
end

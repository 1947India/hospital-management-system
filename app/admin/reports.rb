ActiveAdmin.register Report do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :disease, :labtest, :user_id, :doctor_id, :patient_appointments_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:disease, :labtest, :user_id, :doctor_id, :patient_appointments_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # form do |f|
  #   input :disease
  #   input :user_id
  #   input :patient_appointments_id, :as => :time_picker
  #  f,action
  #  # f.submit
  # end

form do |f|
    f.inputs do
        f.input :disease
        f.input :user_id, as: :select, include_blank: "Please Select user_name", collection: User.pluck(:email)
        f.input :doctor_id, as: :select, include_blank: "Please Select doctor_name", collection: Doctor.pluck(:first_name)
        f.input :patient_appointments_id, as: :select, include_blank: "Please Select patient_appointments_id", collection: PatientAppointment.pluck(:id)
        input :image, as: :file
    end
    f.actions
end

show do
    attributes_table do
      row :user
      row :disease
      row :image do |ad|
      image_tag url_for(ad.image) if ad.image.attached?
      end
    end
  end
end

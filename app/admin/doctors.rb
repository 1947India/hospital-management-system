ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :first_name, :last_name, :email, :specialty, :hospital_name, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :specialty, :hospital_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    input :first_name
    input :email
    input :image, as: :file
    f.submit
   end
# end

 show do
    attributes_table do
      row :first_name
      row :image do |ad|
      image_tag url_for(ad.image) if ad.image.attached?
      end
    end
  end
end
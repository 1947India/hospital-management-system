class CrudNotifictionMailer < ApplicationMailer

  def Create_notifiction(object)
    @object = object
    @object_count = object.class.count
    mail to: 'admin@example.com', subject:"A New entry Created 
    #{object.class} has been creaated"
  end

  def update_notification
    
  end

  def delete_notification
    
  end
end
 
module PatientAppointmentsHelper
def first_name(full_name)
    patient_appointment.doctor.first_name
end

def last_name(full_name)
    patient_appointment.doctor.last_name
end
end

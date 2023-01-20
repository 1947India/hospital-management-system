class ReportController < ApplicationController
  def index
    #@reports = current_user.reports
    
    @report=Report.all

    
     report = PatientAppointment.find_by(user_id:current_user.id).doctor.fullname
      # respond_to do |format|
      # format.html
      # format.pdf do
        #render pdf: "reports#{@reports.count}", filename:"reports/report.html.erb"#, type: "application/pdf"   # Excluding ".pdf" extension
      respond_to do |format|

      format.html
      format.json
      format.pdf {render :page_height => '8in', :page_width => '8in', template: 'report/repo', disposition: 'attachment', pdf:'Repo'}
  end
  end
  def download
    
    # @report=Report.all
    # report = PatientAppointment.find_by(user_id:current_user.id).doctor.fullname
    # respond_to do |format|  
    #   format.html
    #   format.pdf do,:image
    #     #render pdf: "#{report}", template: "repo.pdf.erb"
    #     render pdf: "#{report}", template: "report/repo.pdf.erb"
    #   end
    # end
  end
  #  def download_pdf
  #   client = Report.find(params[:id])
  #   send_data generate_pdf(client),
  #             filename: "#{client.disease}.pdf",
  #             type: "application/pdf"
  # end
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
       redirect_to root_path
    else
      redirect_to root_path  
    end
  end
private
  def report_params
    params.require(:report).permit(:appointment_date, :disease, :doctor_id, :patient_appointments_id,:image)
  end
   # def generate_pdf(client)
   #  Prawn::Document.new do
   #    text client.disease, align: :center
   #    text "user_id: #{client.user_id}"
   #    text "doctor_id: #{client.doctor_id}"
   #  end.render
  
end

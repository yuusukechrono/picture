class ReportMailer < ApplicationMailer
  def report_mail(report)
    @report = report
    mail to: @report.user.email, subject: "投稿の報告"
  end
end

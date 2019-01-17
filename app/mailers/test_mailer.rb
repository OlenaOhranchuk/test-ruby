class TestMailer < ApplicationMailer
  def test
    mail(to: params[:to], subject: 'Test')
  end
end

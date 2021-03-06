class SubscriberMailer < ActionMailer::Base
  default from: "\"Robb Wolff\" <rw@chb.ca>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.new_photo.subject
  #
  def new_photo(subscriber, photo)
    @subscriber = subscriber
    @photo = photo
    attachments.inline['image.jpg'] = File.read("#{@photo.image.path(:email)}")
    mail to: subscriber.email, subject: "New Photo: #{@photo.title}"
  end
end

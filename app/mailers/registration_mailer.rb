class RegistrationMailer < ApplicationMailer
  add_template_helper(RegistrationsHelper)

  default from: ENV["MAILUSER"]

  def registration_confirm(registration, data)
    @data = data
    @registration = registration
    mail(to: @data[:email], subject: I18n.t("mail.registration_confirm.subject"))
  end

  def registration_contact_person(registration, data)
    @data = data
    @registration = registration
    mail(to: @data[:contact_persons_email], subject: I18n.t("mail.registration_contact_person.subject", id: @data[:id]))
  end

  def updated_to_contact_person(data, memory_loss)
    @memory_loss = memory_loss
    @data = data
    mail(to: @data[:contact_persons_email], subject: I18n.t("mail.updated_to_contact_person.subject",id: @data[:id]))
  end

  def updated_to_registree(data)
    @data = data
    mail(to: @data[:email], subject: I18n.t("mail.updated_to_registree.subject"))
  end

end

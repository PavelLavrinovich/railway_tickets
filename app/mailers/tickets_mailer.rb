class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    set_user_and_ticket(user, ticket)
    mail(to: user.email, subject: I18n.t('mailers.tickets.buy.subject'))
  end

  def destroy_ticket(user, ticket)
    set_user_and_ticket(user, ticket)
    mail(to: user.email, subject: I18n.t('mailers.tickets.destroy.subject'))
  end

  private

  def set_user_and_ticket(user, ticket)
    @user = user
    @ticket = ticket
  end
end

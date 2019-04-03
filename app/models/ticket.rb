class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  #before_save :ticket_bought_after_event?
  before_save :ensure_ticket_is_not_created_after_the_start_date_of_the_associated_event

  private
  def ensure_ticket_is_not_created_after_the_start_date_of_the_associated_event
    tt = TicketType.find(self.ticket_type_id)
    event = Event.find(tt.event_id)
    startDate = event.start_date

    puts "startDate: #{startDate}"
    puts "created_at: #{DateTime.now}"
    if DateTime.now > startDate
      #puts "Error en ensure_ticket_is_not_created_after_the_start_date_of_the_associated_event"
      throw :abort
    end
  end

  private
    def ticket_bought_after_event?
      order =  Order.find(self.order_id)
      order_date = order.created_at
      tt = TicketType.find(self.ticket_type_id)
      event = Event.find(tt.event_id)
      event_date = event.start_date
      #puts "Order date: #{order_date}"
      #puts "Event date: #{event_date}"
      val = order_date>event_date
      #puts "Order date < Event date #{val}"
      if val
        #puts "Error en ticket_bought_after_event?"
        throw :abort
      end
    end
end



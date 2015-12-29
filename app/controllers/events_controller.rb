class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :choose, :add_to_cart, :checkout, :purchase, :receipt]

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def choose
  end

  def add_to_cart
    session[:cart] = params[:sessions].keys
    redirect_to checkout_event_path(@event)
  end

  def checkout
  end

  def purchase
    name = params[:name]
    email = params[:email]
    stripe_token = params[:stripe_token]

    member = Member.find_or_create_by(email: email)
    member.update_attributes(name: name)

    sessions = Session.find(session[:cart])

    # Create an Order with Stripe and submit payment
    items = sessions.map do |session|
      {
        type: 'sku',
        amount: session.ticket_cost,
        currency: session.ticket_currency,
        parent: session.sku
      }
    end

    discounts = []
    items.each do
      discounts << {
        type: 'discount',
        amount: -500,
        currency: 'usd',
        description: 'Presale'
      }
    end

    case items.count
    when 3
      discounts << {
        type: 'discount',
        amount: -1000,
        currency: 'usd',
        description: 'Package deal'
      }
    when 4
      discounts << {
        type: 'discount',
        amount: -2000,
        currency: 'usd',
        description: 'Package deal'
      }
    end

    order = Stripe::Order.create(
      currency: 'usd',
      items: items + discounts,
      email: member.email
    )

    order.pay(source: stripe_token)
    base_url = if Rails.env.development?
                 "https://dashboard.stripe.com/orders/test"
               else
                 "https://dashboard.stripe.com/orders/"
               end

    sessions.each do |session|
      Attendee.create(
        member: member,
        session: session,
        payment_method: 'stripe',
        payment_currency: order.currency,
        payment_amount: order.amount,
        payment_url: "#{base_url}/#{order.id}",
        paid_at: order.created
      )
    end

    session.delete(:cart)
    session[:current_member_id] = member.id
    redirect_to receipt_event_path(@event)
  end

  def receipt
    @current_member = Member.find(session[:current_member_id])
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
end

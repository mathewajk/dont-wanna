class ToDontsController < ApplicationController
  before_action :set_to_dont, only: %i[ show edit update destroy toggle ]

  def index
    @to_donts = ToDont.where(user: Current.user)
  end

  def show
  end

  def new
    @to_dont = ToDont.new
  end

  def create
    @to_dont = ToDont.create(to_dont_params)
    if @to_dont.save
      render turbo_stream: [
        turbo_stream.prepend("to_donts", @to_dont),
        turbo_stream.replace("new_to_dont", partial: "to_donts/form", locals: { to_dont: ToDont.new })
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @to_dont.update(to_dont_params)
      redirect_to @to_dont
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle
    if @to_dont.update(toggle_params)
      msg = {status: "ok"}
      render :json => msg
    else
      render :json => @to_dont, status: :unprocessable_entity
    end
  end

  def destroy
    @to_dont.destroy
    render turbo_stream: [
      turbo_stream.remove(@to_dont)
    ]
  end
  
  private
    def to_dont_params
      params.expect(to_dont: %i[ task user_id ])
    end

    def set_to_dont
      @to_dont = ToDont.find(params[:id])
    end

    def toggle_params
      params.expect(to_dont: %i[ completed ])
    end
end

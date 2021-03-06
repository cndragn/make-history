class EntriesController < ApplicationController

  def index
    # @entries = Entry.all
    @entries = Entry.where(:user_id => current_user.id)
    date = Time.now
    @year = date.strftime("%Y")
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
    forismatic = HTTParty.get('https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en')
    @quote = forismatic["quoteText"]
    @author = forismatic["quoteAuthor"]
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id

    if @entry.save
      redirect_to @entry
    else
      render 'new'
    end
  end

  def update
    @entry = Entry.find(params[:id])

    if @entry.update(entry_params)
      redirect_to @entry
    else
      render 'edit'
    end
  end

  def destroy
  @entry = Entry.find(params[:id])
  @entry.destroy

  redirect_to entries_path
end

  private
  def entry_params
    params.require(:entry).permit(:title, :text)
  end
end

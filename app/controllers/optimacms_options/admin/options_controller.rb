
class  OptimacmsOptions::Admin::OptionsController < Optimacms::Admin::AdminBaseController


  #include FilterHelper
  # search
  #search_filter :index, {save_session: true, search_method: :post_and_redirect, url: :admin_options_url, search_url: :search_admin_options_url, search_action: :search} do
  search_filter :index, {save_session: true, search_method: :post_and_redirect, url: :admin_options_url, search_url: :search_admin_options_url} do
    default_order "id", 'desc'

    # fields
    field :name, :string, :text, {label: 'name', default_value: '', condition: :like_full, input_html: {style: "width: 240px"}}
  end

  define_method("search2") do
    #redirect_to action: name.to_sym

    #redirect_to main_app.send(options[:url])
    #redirect_to send(options[:url])
    #redirect_to '/'

    redirect_to send(:admin_options_url)
    #render :text=>'1'
  end


  def search3
    #redirect_to action: name.to_sym
    #redirect_to main_app.send(options[:url])
    redirect_to send(:admin_options_url)
    #redirect_to '/'
  end

  def index
    @items = Option.by_filter(@filter)
  end

  def new
    @option = Option.new
  end

  def edit
    @option = Option.find(params[:id])
  end

  def create
    # input
    @option = Option.new(option_params)

    @res = @option.save

    respond_to do |format|
      if @res

        format.html {
          #redirect_to @user, notice: 'User was successfully created.'
          redirect_to admin_options_path, notice: 'Congratulations! You just create option!'
        }

      else
        format.html {
          render :new
        }

      end
    end
  end

  def update
    @id = params[:id]

    @option = Option.find(@id)

    @res = @option.update(option_params)

    respond_to do |format|
      if @res
        format.html {
          redirect_to main_app.admin_options_path, notice: 'Congratulations! You just edit option!'
        }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def option_params
    params.require(:option).permit(:name, :description, :title, :is_changed, :category, :value, :option_type)
  end
#####################

=begin
  def model
    return Option
  end

  def model_list
    Option
  end

  def url_list
    options_url
  end

  def sym_model
    return :option
  end

  def index

# get
    @items = model_list.all

  end

  def show
    id = params[:id].to_i || 0
    @item = model_list.find(id)

  end

  def new
    @item = model_list.new

    respond_to do |format|
      format.html {
#render 'new'
      }
      format.json {
        render json: @item
      }
    end
  end

  def edit
    id = params[:id].to_i || 0
    @item = model_list.find(id)
  end

  def create
    @item = model_list.new(params[sym_model])

    respond_to do |format|
#flash[:notice] = 'Saved'

      if @item.save
        format.html {
          redirect_to url_list, notice:'Saved'
        }
        format.json {
          render json: @item, status: :created, location: url_list
        }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    id = params[:id].to_i || 0
    @item = model_list.find(id)

    if @item.update_attributes(params[sym_model])
      redirect_to url_list, notice: 'Saved'
    else
      render action: "edit"
    end
  end

  def destroy
    model_list.find(params[:id]).destroy
    redirect_to url_list, :flash => { :success => "Deleted" }
  end
=end
end


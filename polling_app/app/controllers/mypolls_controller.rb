class MypollsController < ApplicationController
  before_action :set_mypoll, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index,:destroy]
  @pcount=0
  # GET /mypolls
  # GET /mypolls.json
  def index
    @mypolls = Mypoll.all
    @category1 = Category.all

    @pollsarray =[]
    @category1.each do |poll|
       @pollarray = [poll.name,poll.count]
       @pollsarray.push(@pollarray)
     end

  end
  

  # GET /mypolls/1
  # GET /mypolls/1.json
  def show
  end

  # GET /mypolls/new
  def new
    @mypoll = Mypoll.new
  end

  # GET /mypolls/1/edit
  def edit
  end

  # POST /mypolls
  # POST /mypolls.json
  def create
    
    @mypoll = Mypoll.new(mypoll_params)
    @mypoll.user = current_user
     @sur = current_user
     @sur.count+=1
     @category=Category.find(@mypoll.category_id)
        @category.count+=1
        respond_to do |format|
      if @mypoll.save and @category.save and @sur.save
       
        
        format.html { redirect_to @mypoll, notice: 'Mypoll was successfully created.' }
        format.json { render :show, status: :created, location: @mypoll }
      else
        format.html { render :new }
        format.json { render json: @mypoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mypolls/1
  # PATCH/PUT /mypolls/1.json
  def update
    respond_to do |format|
      if @mypoll.update(mypoll_params)
        format.html { redirect_to @mypoll, notice: 'Mypoll was successfully updated.' }
        format.json { render :show, status: :ok, location: @mypoll }
      else
        format.html { render :edit }
        format.json { render json: @mypoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mypolls/1
  # DELETE /mypolls/1.json
  def destroy
    @category=Category.find(@mypoll.category_id)
        if @category.count>0
        @category.count-=1
        @category.save
        end
        @mypoll.destroy
    
    respond_to do |format|
      format.html { redirect_to mypolls_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mypoll
      @mypoll = Mypoll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mypoll_params
      params.require(:mypoll).permit(:category_id)
    end
end

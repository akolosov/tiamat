class TaskContextsController < ApplicationController
  load_and_authorize_resource

  # GET /task_contexts
  # GET /task_contexts.json
  def index
    @task_contexts = TaskContext.accessible_by(current_ability)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_contexts }
    end
  end

  # GET /task_contexts/1
  # GET /task_contexts/1.json
  def show
    @task_context = TaskContext.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_context }
    end
  end

  # GET /task_contexts/new
  # GET /task_contexts/new.json
  def new
    @task_context = TaskContext.new

    @task_context.user = @current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_context }
    end
  end

  # GET /task_contexts/1/edit
  def edit
    @task_context = TaskContext.find(params[:id])
  end

  # POST /task_contexts
  # POST /task_contexts.json
  def create
    @task_context = TaskContext.new(params[:task_context])

    respond_to do |format|
      if @task_context.save
        format.html { redirect_to @task_context, notice: 'Task context was successfully created.' }
        format.json { render json: @task_context, status: :created, location: @task_context }
      else
        format.html { render action: "new" }
        format.json { render json: @task_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_contexts/1
  # PUT /task_contexts/1.json
  def update
    @task_context = TaskContext.find(params[:id])

    respond_to do |format|
      if @task_context.update_attributes(params[:task_context])
        format.html { redirect_to @task_context, notice: 'Task context was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_contexts/1
  # DELETE /task_contexts/1.json
  def destroy
    @task_context = TaskContext.find(params[:id])
    @task_context.destroy

    respond_to do |format|
      format.html { redirect_to task_contexts_url }
      format.json { head :ok }
    end
  end
end

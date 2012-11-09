class TasksController < ApplicationController
  load_and_authorize_resource

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.accessible_by(current_ability)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks
  # GET /tasks.json
  def filter
    if (params[:type]) and (params[:id])
      if params[:type] == 'project'
        @tasks = Task.where(:project_id => params[:id], :parent_id => nil )
      elsif params[:type] == 'context'
        @tasks = Task.where(:task_context_id => params[:id], :parent_id => nil )
      elsif params[:type] == 'folder'
        @tasks = Task.where(:folder_id => params[:id], :parent_id => nil )
      elsif params[:type] == 'tag'
        @tasks = Task.all(:conditions =>  ["id in (select task_id from tag_task_relations where tag_id = #{params[:id]})"])
      end
    else
      @tasks = Task.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    @task.user = @current_user

    if (params[:type]) and (params[:id])
      if params[:type] == 'project'
        @task.project = Project.find(params[:id])
      elsif params[:type] == 'context'
        @task.task_context = TaskContext.find(params[:id])
      elsif params[:type] == 'folder'
        @task.folder = Folder.find(params[:id])
      elsif params[:type] == 'task'
        @task.parent = Task.find(params[:id])
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/child/1
  # GET /tasks/child/1.json
  def child
    @task = Task.new
    @task.user = @current_user
    @task.parent = Task.find(params[:id])
    @task.folder = @task.parent.folder
    @task.project = @task.parent.project
    @task.task_context = @task.parent.task_context

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
end
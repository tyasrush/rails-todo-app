class ApiController < ApplicationController

  def index
    render json: Todoo.all.as_json(only: [:id, :name, :priority, :time])
  end

  def get
    render json: Todoo.find(params[:id]).as_json(only: [:id, :name, :priority])
  end

  def create
    result = {}
    todo = Todoo.new
    todo.name = params[:name]
    todo.time = params[:time]
    todo.priority = params[:priority]
    if todo.save
      result['error'] = false
      result['message'] = 'todo berhasil disimpan'
    else
      result['error'] = true
      result['message'] = 'todo gagal disimpan'
    end

    render json: result
  end

  def update
    result = {}
    todo = Todoo.find(params[:id])
    if todo.update_attributes(name: params[:name], time: params[:time], priority: params[:priority])
      result['error'] = false
      result['message'] = 'todo berhasil diupdate'
    else
      result['error'] = true
      result['message'] = 'todo gagal diupdate'
    end

    render json: result
  end

  def delete
    result = {}
    todo = Todoo.find(params[:id])
    if todo.destroy
      result['error'] = false
      result['message'] = 'todo berhasil dihapus'
    else
      result['error'] = true
      result['message'] = 'todo gagal dihapus'
    end

    render json: result
  end

  private
  def todo_params
    params.require(:todoo).permit(:name, :time, :priority)
  end
end

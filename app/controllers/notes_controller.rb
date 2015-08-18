class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @notes = Note.all.order('created_at DESC')
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
  def new
    @note = current_user.notes.build
  end

  
  
  def create
    @note = current_user.notes.build(note_params)
    
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end
  
  def destroy
  end
  
  
  private
  
  def find_note
    @note = Note.find(params[:id])
  end
  
  def note_params
    params.require(:note).permit(:status, :link)
  end
  
end

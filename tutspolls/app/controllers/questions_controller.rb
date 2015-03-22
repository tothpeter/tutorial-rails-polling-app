class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_poll
  before_action :set_kind_questions

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = @poll.questions.build
  end

  def edit
  end

  def create
    @question = @poll.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @poll, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @poll, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to poll_questions_url(@poll), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :kind, :poll_id)
    end

    def set_poll
      @poll = Poll.find params[:poll_id]
    end

    def set_kind_questions
      @kind_options = [
        [ "Open Answer", "open" ],
        [ "Multiple choice", "choice" ]
      ]
    end
end
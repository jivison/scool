class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
    assignment_params = params.require(:assignment).permit(:name, :description)
    Assignment.create assignment_params
    # render text: "Assignment created successfully"
    # @question = Question.new question_params
    # @question.user = current_user

    # if @question.save
    #   flash[:notice] = "Question created successfully"
    #   #if question is saved successfully redirect them to the question they just created
    #   redirect_to question_path(@question)
    # else
    #   #if question is not saved successfully render new
    #   render :new
    # end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end

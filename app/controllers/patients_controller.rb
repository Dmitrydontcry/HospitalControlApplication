class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    if is_admin?
      @patients = Patient.all
    else
      @patients = Patient.joins(:user).where(user_id: current_user.id).all
    end
  end

  def show
    @analyses = Analysis.where(patient_id: @patient.id).all
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patient_url(@patient), notice: "Пациент успешно создан" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_url(@patient), notice: "Пациент успешно обновлен." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy

    redirect_to patients_url, notice: "Пациент успешно удален."
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:first_name, :last_name)
    end
end

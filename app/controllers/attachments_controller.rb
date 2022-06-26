class AttachmentsController < ApplicationController
  before_action :set_attachment, only: %i[ destroy download ]

  def index
    @attachments = Attachment.all
  end

  def create
    p params
    (params[:attachments] || []).each do |attachment|
      Attachment.create(
        name: attachment.original_filename,
        data: attachment.read,
        analysis_id: params[:analysis_id]
      )
    end

    redirect_to analysis_path(params[:analysis_id])
  end

  def download
    send_data(@attachment.data,
      filename: @attachment.name,
      type: "application/x-www-form-urlencoded; charset=utf-8",
      disposition: 'inline',
      stream: 'true',
      x_sendfile: true
    )

  end

  def destroy
    @attachment.destroy!

    redirect_to analysis_path(params[:analysis_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_params
      params.require(:attachment).permit(:name, :data)
    end
end

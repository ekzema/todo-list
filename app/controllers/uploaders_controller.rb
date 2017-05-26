class UploadersController < ApplicationController
before_action :authenticate_user!
  def create      
      @fileupload = Uploader.create(uploader_params)
    respond_to do |format|
      format.js
    end
  end
    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def uploader_params
      params.require(:uploader).permit(:comment_id, :commentfile)
    end
end

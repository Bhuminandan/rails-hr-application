class DocumentsController < ApplicationController

    before_action :set_document, only: [:show, :edit, :update, :destroy]

    def index
        @documents = Document.all
    end

    def new 
        @document = Document.new
    end

    def create
        @document = Document.new(document_params)
        if @document.save
            redirect_to documents_path,
            notice: "Document was successfully created."
        else
            redirect_to documents_path
        end
    end

    def edit
    end

    def update
        if @document.update(document_params)
            redirect_to document_path,
            notice: "Document was successfully updated."
        else
            render :edit
        end
    end

    def show
    end

    def destroy
        @document.destroy
        redirect_to documents_path
    end

    private

    def document_params
        params.require(:document).permit(:name, :doc_type, :employee_id, :image)
    end

    def set_document
        @document = Document.find(params[:id])
        rescue ActiveRecord::RecordNotFound => error
        redirect_to document_path
        flash[:notice] = error
    end
end
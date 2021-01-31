<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :xml, :json

  # GET <%= route_url %>
  # GET <%= route_url %>.json
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.json
  def show
  end

  # GET <%= route_url %>/new
  def new
    @title_page = t('helpers.create')
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    respond_modal_with @<%= singular_table_name %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    @title_page = t('helpers.edit')
    respond_modal_with @<%= singular_table_name %>
  end

  # POST <%= route_url %>
  # POST <%= route_url %>.json
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    if  @<%= orm_instance.save %>
      respond_modal_with @<%= singular_table_name %>, location: <%= singular_table_name.pluralize %>_path
    else
      respond_modal_with @<%= singular_table_name %>
    end
  end

  # PATCH/PUT <%= route_url %>/1
  # PATCH/PUT <%= route_url %>/1.json
  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      respond_modal_with @<%= singular_table_name %>, location: <%= singular_table_name.pluralize %>_path
    else
      respond_modal_with @<%= singular_table_name %>
    end
  end

  # DELETE <%= route_url %>/1
  # DELETE <%= route_url %>/1.json
  def destroy
    @<%= orm_instance.destroy %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: t('messages.destroy_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a list of trusted parameters through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params.fetch(<%= ":#{singular_table_name}" %>, {})
      <%- else -%>
      params.require(<%= ":#{singular_table_name}" %>).permit(<%= permitted_params %>)
      <%- end -%>
    end
end
<% end -%>

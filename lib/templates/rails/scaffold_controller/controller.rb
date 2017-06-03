<% namespace_name = controller_class_name.include?('::') ? controller_class_name.split("::").first : false -%>
<% singular_table_name.gsub!("#{namespace_name.downcase}_", '') if namespace_name.present? -%>
<% plural_table_name.gsub!("#{namespace_name.downcase}_", '') if namespace_name.present? -%>
<% route_url_sanitized = namespace_name.present? ? route_url.gsub("#{namespace_name.downcase}/", '') : route_url -%>
<% class_name_sanitized = namespace_name.present? ? class_name.gsub("#{namespace_name}::", '') : class_name -%>
<% index_helper_sanitized = namespace_name.present? ? index_helper.gsub("#{namespace_name.downcase}_", '') : index_helper -%>
<% have_references = false -%>
<% attributes.each do |attribute| -%>
<% if attribute.reference? -%>
<% have_references = true -%>
<% end -%>
<% end -%>
<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < <%= "#{namespace_name}::" if namespace_name.present? %>ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
<% if have_references -%>
  before_action :load_references, only: [:new, :edit, :create, :update]
<% end -%>  

  # GET <%= route_url_sanitized %>
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name_sanitized) %>.paginate(page: params[:page], per_page: 25)
  end

  # GET <%= route_url_sanitized %>/1
  def show
  end

  # GET <%= route_url_sanitized %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name_sanitized) %>
  end

  # GET <%= route_url_sanitized %>/1/edit
  def edit
  end

  # POST <%= route_url_sanitized %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name_sanitized, "#{singular_table_name}_params") %>

    if @<%= orm_instance.save %>
      redirect_to <%= index_helper_sanitized %>_path, notice: <%= "'#{human_name} criado com sucesso.'" %>
    else
      render :new
    end
  end

  # PATCH/PUT <%= route_url_sanitized %>/1
  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to <%= index_helper_sanitized %>_path, notice: <%= "'#{human_name} atualizado com sucesso.'" %>
    else
      render :edit
    end
  end

  # DELETE <%= route_url_sanitized %>/1
  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper_sanitized %>_path, notice: <%= "'#{human_name} excluído com sucesso.'" %>
  end

  private
    # Carregar <%= singular_table_name %> por ID
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name_sanitized, "params[:id]") %>
    end
<% if have_references -%>

    # Carregar registros associados
    def load_references
<% attributes.each do |attribute| -%>
<% if attribute.reference? -%>
      @<%= attribute.name.pluralize %> = <%= attribute.name.camelize %>.all
<% end -%>
<% end -%>
    end
<% end -%>

    # Permitir somente parâmetros úteis
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>

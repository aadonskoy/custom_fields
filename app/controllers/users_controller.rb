class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    if selected_user.update(user_params)
      render json: selected_user
    else
      render json: selected_user.errors, status: :unprocessable_entity
    end
  end

  protected

  def selected_user
    @selected_user ||= User.find(params[:id])
  end

  def custom_fields_params
    @custom_fields = FieldTemplate.where(
      tenant_id: selected_user.tenant_id
    ).map do |template|
      if template.field_type == "FieldValueMultiselect"
        { template.name.parameterize.underscore => [] }
      else
        template.name.parameterize.underscore
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :tenant_id, *custom_fields_params)
  end
end

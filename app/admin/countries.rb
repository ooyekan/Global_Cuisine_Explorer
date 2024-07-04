ActiveAdmin.register Country do

  permit_params :name, :capital, :population, :area, :region, :subregion, review_ids: []

  filter :reviews_id, as: :select, collection: proc { Review.pluck(:id, :id) }
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :capital, :region, :subregion, :population, :area, :flag_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :capital, :region, :subregion, :population, :area, :flag_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

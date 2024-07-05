ActiveAdmin.register Review do
  permit_params :reviewer_name, :content, :image, :country_id

  # Customize the index view with filters and columns
  # filter :reviewer_name
  # filter :country_id, as: :select, collection: proc { Country.pluck(:name, :id) }, label: 'Country'
  config.filters = false
  index do
    selectable_column
    id_column
    column :reviewer_name
    column :content
    column :country do |review|
      review.country.name if review.country
    end
    actions
  end

  form do |f|
    f.inputs 'Review Details' do
      f.input :reviewer_name
      f.input :content
      f.input :country_id, as: :select, collection: Country.pluck(:name, :id)
      f.input :image, as: :file
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :reviewer_name, :content, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:reviewer_name, :content, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

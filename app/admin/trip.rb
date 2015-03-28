ActiveAdmin.register Trip do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :title, :leader, :price, :start_date, :end_date, :description, :custom

  index do
    selectable_column
    id_column
    column :title
    column :leader
    column :price
    column :start_date
    column :end_date
    actions
  end
end

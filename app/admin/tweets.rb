ActiveAdmin.register Tweet do
  belongs_to :user
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :tw_content, :user_id, :retweet_child, :retweet
  #
  # or
  #
  # permit_params do
  #   permitted = [:tw_content, :user_id, :retweet_child, :retweet]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

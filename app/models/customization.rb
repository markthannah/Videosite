class Customization < ActiveRecord::Base
  belongs_to :video
  belongs_to :custom_page,  -> { order 'customizations.cporder' }

end

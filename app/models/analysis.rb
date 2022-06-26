class Analysis < ApplicationRecord
    belongs_to :patient

    has_many :attachments
end

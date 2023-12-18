class Document < ApplicationRecord

  DOC_TYPES = %w[
    passport
    driving_licence
    voter_id
    national_id
    passport
    driving_licence
    voter_id
    national_id
    marksheet
    Educational
    others
  ].freeze


  belongs_to :employee



  has_one_attached :image

  validates :name, :doc_type, presence: true
end

class Employee < ApplicationRecord

    has_many :documents

    validates :first_name, :last_name, presence: true
    validates :personal_email, presence: true, uniqueness: true
    validates :city, :state, :country, :pincode, :address_line_1, :address_line_2, presence: true


    def full_name
        "#{first_name} #{last_name}".strip
    end

    def full_address
        "#{address_line_1} #{address_line_2} #{city} #{state} #{country} #{pincode}".strip
    end

    def name_with_email
        "#{first_name} (#{personal_email})"
    end
end

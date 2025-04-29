class Student < ApplicationRecord
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone, presence: true, format: { with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/, message: "must be a valid phone number" }
  
  # Encryption configuration for sensitive data
  # Uncomment once Rails Active Record Encryption is set up
  # encrypts :first_name, deterministic: true
  # encrypts :last_name, deterministic: true
  # encrypts :email, deterministic: true 
  # encrypts :phone, deterministic: true
  # encrypts :address
  
  # Scopes for filtering
  scope :with_internship, -> { where(internship: true) }
  scope :with_higher_ed, -> { where(higher_ed: true) }
  scope :contactable_by_text, -> { where(texts: true) }
  scope :contactable_by_call, -> { where(calls: true) }
  
  # Interests scopes
  scope :interested_in_climate_change, -> { where(climate_change: true) }
  scope :interested_in_democracy, -> { where(democracy: true) }
  scope :interested_in_poverty, -> { where(poverty: true) }
  scope :interested_in_mass_transit, -> { where(mass_transit: true) }
  scope :interested_in_consumer, -> { where(consumer: true) }
  
  # Helper methods
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def full_address
    return "" if address.blank?
    
    address_parts = [address]
    address_parts << "#{city}, #{state} #{zip_code}" if city.present? && state.present?
    address_parts.join(", ")
  end
  
  def interests
    interests = []
    interests << "Climate Change" if climate_change?
    interests << "Democracy" if democracy?
    interests << "Poverty" if poverty?
    interests << "Mass Transit" if mass_transit?
    interests << "Consumer" if consumer?
    interests
  end
end
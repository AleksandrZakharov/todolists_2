class Profile < ActiveRecord::Base
  def self.get_all_profiles(min_birth_year, max_birth_year)
  	Profile.where("birth_year BETWEEN :min_year AND :max_year",min_year: min_birth_year, max_year: max_birth_year).order(birth_year: :asc)
  end

  belongs_to :user

  validate :first_and_last_name_not_null_both
  

  def first_and_last_name_not_null_both
  	if !first_name and !last_name
  		errors.add(:first_name,"First name and last name can't be NULL both!")
  	end
    
  end
  validates :gender, :inclusion => %w(male female)
  validate :boy_Sue
  def boy_Sue
  	if gender == "male" and first_name == "Sue"
  		errors.add(:first_name,"Bad boy")
  	end
  end

end

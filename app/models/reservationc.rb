class Reservationc < ApplicationRecord
    validates :name, presence: true
    validate :date_before_start
    validate :start_time_not_sunday
    validate :start_time_not_saturday
    validate :time_only
    validates :start_time, uniqueness: { message: 'Is reserved by another user' }
  
    def date_before_start
      errors.add(:start_time, "Cannot select past dates") if start_time < Date.today
    end
  
    def start_time_not_sunday
      errors.add(:start_time, "Cannot select sunday") if start_time.sunday?
    end
  
    def start_time_not_saturday
      errors.add(:start_time, "Cannot select saturday") if start_time.saturday?
    end
    
    def time_only
      if hour_only_1 && min_only
        true
      elsif hour_only_2 && min_only
        true
      else
        errors.add(:start_time, "(time)Is 13:15 or 19:Will be 15")
      end
    end
  
    def hour_only_19
      start_time.hour == 19
    end
  
    def hour_only_13
      start_time.hour == 13
    end
  
    def min_only
      start_time.min == 15
    end
end

class Meeting < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :start_time,
            uniqueness: {
              message: 'Este horario nao esta disponivel',
            }
            
end
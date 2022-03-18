class Meeting < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :start_time,
            uniqueness: {
              message: 'Este horario nao esta disponivel',
            }
validate :is_end_before
validate :is_past
validate :hour_range

def is_end_before
  if(start_time > end_time)
    self.errors.add(:start_time, "O data do fim da reunião deve ser superior ao inicio.")
  end 
end        

def is_past
  if (start_time < Time.now)
    self.errors.add(:start_time, "O agendamento só é possivel para datas futuras, com uma antecedencia minima de 3 horas.")
  end
end

def hour_range
  if(start_time.hour < 6)
    self.errors.add(:start_time, "As salas de reunião estao disponiveis entre as 6 as 23 horas.")
  end
end



end
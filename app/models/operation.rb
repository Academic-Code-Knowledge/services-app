class Operation < ApplicationRecord
  belongs_to :order
  
  def avance
    avance = 0
    if status == 'not-started'
      avance = 0
    elsif status == 'in-progress'
      avance = 50
    elsif status == 'complete'
      avance = 100 
    end
  end
end

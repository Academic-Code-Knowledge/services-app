class Operation < ApplicationRecord
  belongs_to :order

  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Complete', 'complete']
  ]

  def complete
    status == 'complete'
  end

  def in_progress
    status == 'in-progress'
  end

  def not_started
    status == 'not-started'
  
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

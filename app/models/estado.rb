class Estado < ActiveRecord::Base
  
  belongs_to :country

  def to_s
    "#{nome}".strip
  end

end

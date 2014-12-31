class Cidade < ActiveRecord::Base
  
  belongs_to :estado

  def to_s
    "#{nome}".strip
  end

end

class Country < ActiveRecord::Base

  def to_s
    "#{nome}".strip
  end

end

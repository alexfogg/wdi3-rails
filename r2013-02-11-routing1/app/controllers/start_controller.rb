class StartController < ApplicationController
  def start
  end

  def A
  end

  def B
  end

  def door
    case params['option'].upcase
    when 'start' then redirect_to('/start')
    when 'A' then redirect_to('/A')
    when 'B' then redirect_to('/B')
    when '1' then redirect_to('/1')
    when '2' then redirect_to('/2')
    when '3' then redirect_to('/3')
    end
  end

  def One
  end

  def Two
  end

  def Three
  end

end
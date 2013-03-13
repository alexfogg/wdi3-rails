class HomeController < ApplicationController

  def home
  end
  def numbers
    @amount = 234
    @large_number = 43343552342653213
    @phone = 6095589593
  end
  def text
    @numbers = (1..20).to_a
    @person_count1 = 1
    @person_count2 = 2
    @story = "a very long time ago in a very far away place blah blah blah"
    end
  def assets
  end
  def url
  end

end
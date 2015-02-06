class HomeController < ApplicationController

  def index
  end

  def test_api
    my_hash = {stuff: "blah", number: 23, another_number: 24}
    render json: my_hash
  end

end

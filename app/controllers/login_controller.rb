class LoginController < ApplicationController
  def index
    def index
      login = {'user'  => 'jdoe',
               'pass' => 'password'
      }
      respond_to do |format|
        format.html
        format.js { render 'index'}
      end

    end
  end
end

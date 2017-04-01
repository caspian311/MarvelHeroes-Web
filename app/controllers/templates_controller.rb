class TemplatesController < ApplicationController
  skip_before_action :authenticate

  def show
    render file: Rails.root.join('app', 'assets', 'javascripts', params[:template])
  end
end

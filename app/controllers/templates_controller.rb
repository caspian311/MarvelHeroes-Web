class TemplatesController < ApplicationController
  skip_filter :authenticate

  def show
    render file: Rails.root.join('app', 'assets', 'javascripts', params[:template])
  end
end

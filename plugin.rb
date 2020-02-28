# name: Share links5
# about: Add more services to share on.
# version: 0.1.0
# author: null
# url: https://github.com/zhangml123/discourse_share_links


after_initialize do

  module ::DiscourseQrcode
    class Engine < ::Rails::Engine
      engine_name "discourse_qrcode"
      isolate_namespace DiscourseQrcode
    end
  end	
  require_dependency "application_controller"
  class DiscourseQrcode::GetQrcodeController < ::ApplicationController
  	skip_before_action :check_xhr, only: [:index]
    def index
      qrcode_svg = RQRCode::QRCode.new("test").as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 4
      )

      render html: qrcode_svg.html_safe
      
    end
  end
  DiscourseQrcode::Engine.routes.draw do
    get "/get-qrcode" => "get_qrcode#index"
  end

  Discourse::Application.routes.append do
    mount ::DiscourseQrcode::Engine, at: "/"
  end
end
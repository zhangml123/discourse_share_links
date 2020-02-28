# name: Share links5
# about: Add more services to share on.
# version: 0.1.0
# author: null
# url: https://github.com/zhangml123/discourse_share_links
require_dependency "application_controller"
class GerQrcodeController < ::ApplicationController
  def index
    qrcode_svg = RQRCode::QRCode.new("test").as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )

    render json: success_json.merge(
      key: "key",
      qr: qrcode_svg
    )
  end
end
Discourse::Application.routes.prepend do
    get "/get-qrcode" => "get_qrcode#index"
end

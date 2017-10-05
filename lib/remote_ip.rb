class RemoteIp
  def initialize(app)
    @app = app
  end


  def remote_ip
      @remote_ip ||= (@env["action_dispatch.remote_ip"] || ip).to_s
  end

end

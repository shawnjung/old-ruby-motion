class AppDelegate < PM::Delegate
  include MotionDataWrapper::Delegate
  def on_load(app, options)
    init_user
    open SongIndexScreen.new(nav_bar: true)
  end

  def init_user
    @current_user ||= User.create created_at: Time.now if User.count == 0
  end


  def current_user
    @current_user ||= User.first || init_user
  end
end
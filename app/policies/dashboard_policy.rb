class DashboardPolicy < Struct.new(:user, :dashboard)
  def index?
    user.User?
  end
end

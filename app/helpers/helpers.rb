class Helpers
  def self.current_user(sesh)
    User.find(sesh[:id])
  end

  def self.is_logged_in?(sesh)
    sesh.has_key?(:id)
  end
end

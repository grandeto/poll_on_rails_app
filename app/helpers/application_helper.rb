module ApplicationHelper
  REALM = Rails.application.credentials.dig(:ADMIN_SECRET)
  USERS = {
          Rails.application.credentials.dig(:ADMIN_USER) => Rails.application.credentials.dig(:ADMIN_PASS),
          Rails.application.credentials.dig(:ADMIN_DAP) => Digest::MD5.hexdigest([Rails.application.credentials.dig(:ADMIN_DAP),REALM,Rails.application.credentials.dig(:ADMIN_PASS)].join(":"))
  }
  # HTTP Digest Auth
  def authenticate_helper
    authenticate_or_request_with_http_digest(REALM) do |username|
      USERS[username]
    end
  end
end

class DeviseFailure < Devise::FailureApp

  def respond
    return super unless request.content_type == 'application/json'
    self.status = 401
    self.content_type = :json
  end

end
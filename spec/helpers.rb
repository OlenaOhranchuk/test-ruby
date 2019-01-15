module Helpers
  def json
    JSON.parse(response.body).with_indifferent_access
  end
end

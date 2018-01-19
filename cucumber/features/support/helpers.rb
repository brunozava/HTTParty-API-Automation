module Helpers
    def remove_account(user)
        HTTParty.delete("http://nbooks.herokuapp.com/api/accounts/#{user['email']}")
    end
end
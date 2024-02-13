module SessionsHelper
    # Logs in the given user
    def log_in(user)
        # Places cookie on the user's browser to set session
        session[:user_id] = user.id
    end

    
    
    # current_user returns the current logged-in user (if any).
    # Grabs cookie from browser, decrypts and pulls out user's id

    # We could do it like this but it isn't idiomatically correct:
    # def current_user
    #     if @current_user.nil?
    #         # Current_user is an instance variable
    #         @current_user = User.find_by(id: session[:user_id])
    #     else
    #         @current_user
    # end



    # Instead, we use memoization.
    def current_user
        # Current_user is an instance variable
        # The next line just says this but more succinctly -
        # @current_user = @current_user || User.find_by(id: session[:user_id]):
        @current_user ||= User.find_by(id: session[:user_id])
        # ^That either finds the current user in the DB or finds based on session ID of the cookie in their browser
    end

    #returns true if user is logged in, false if not.
    def logged_in?
        !current_user.nil?
    end

    #Logs out the current user.
    def log_out
        reset_session
        session.delete(:user_id)
        @current_user = nil
    end
end

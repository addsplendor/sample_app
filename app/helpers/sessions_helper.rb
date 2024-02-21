module SessionsHelper
    # Logs in the given user
    def log_in(user)
        # Places cookie on the user's browser to set session
        session[:user_id] = user.id
    end

    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    #Forgets a persistent session.
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
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

    # Returns true if the given user is the current user
    def current_user?(user)
        user == current_user
    end

    # Instead, we use memoization.
    def current_user
        # Below line does this: user_id = session[:user_id]
        # if user_id
        if (user_id = session[:user_id])
            # Current_user is an instance variable
            # The next line just says this but more succinctly -
            # @current_user = @current_user || User.find_by(id: session[:user_id]):
            @current_user ||= User.find_by(id: user_id)
            # ^That either finds the current user in the DB or finds based on session ID of the cookie in their browser
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in(user)
                @current_user = user
        end
      end
    end

    #returns true if user is logged in, false if not.
    def logged_in?
        !current_user.nil?
    end

    #Logs out the current user.
    def log_out
        forget(current_user)
        reset_session
        session.delete(:user_id)
        @current_user = nil
    end

    # Redirects to stored location (or the default).
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    # Stores the URL trying to be accessed.
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
end

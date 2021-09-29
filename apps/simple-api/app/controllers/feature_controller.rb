class FeatureController < ApplicationController
  def alpha
    return render_not_found unless feature_enabled?(:alpha_feature)

    render_gif('nyan-cat-1.gif')
  end

  def beta
    return render_not_found unless user_enabled?(:beta_feature) 

    render_gif('gandalf-sax-guy.gif')
  end

  def vip
    return render_not_found unless user_enabled?(:vip_feature)
  
    render_gif('vip.gif')
  end

  private

    def user
      @user ||= User.find_by(id: params[:id])
    end
  
    def feature_enabled?(feature)
      Flipper.enabled?(feature)
    end

    def user_enabled?(feature)
      return Flipper[feature].enabled?(user) if user.present?

      false
    end

    def render_gif(gif_name)
      send_file(
        "#{Rails.root}/files/#{gif_name}",
        type: 'image/gif',
        disposition: 'inline'
      )
    end

    def render_not_found
      render json: '', status: :not_found
    end
end
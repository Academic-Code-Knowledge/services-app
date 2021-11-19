module Admin::FlashHelper
    def show_message(flash)
      if flash[:success].present?
        icon = 'success'
        title = 'Por favor debes agregar sus respectivas etapas'
        message = flash[:success]
      elsif flash[:error].present?
        icon = 'error'
        title = 'Error!'
        message = flash[:error]
      else
        icon = 'success'
        title = 'Alerta!'
        message = flash[:notice]
      end
      flash.clear
      return icon, title, message
    end
end
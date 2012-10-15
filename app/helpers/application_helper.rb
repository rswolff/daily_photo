module ApplicationHelper
	def alert_type(flash_key)
		case flash_key
		when :notice
			t = 'alert-success'
		when :alert
			t = 'alert-error'
		end
		t
	end
end
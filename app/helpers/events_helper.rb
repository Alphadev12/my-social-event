module EventsHelper
	def date_month
		if @old_date.month < 10
			@month = "0" + @old_date.month.to_s
		else
			@month = @old_date.month
		end
	end

	def date_day
		if @old_date.day < 10
			@day = "0" + @old_date.day.to_s
		else
			@day = @old_date.day
		end
	end

end

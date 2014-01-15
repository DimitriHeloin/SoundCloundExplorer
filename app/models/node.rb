class Node < ActiveRecord::Base

	attr_accessor :username, :id_soundcloud
	def set_id(id)
		@id_soundcloud=id
	end

	def set_username(name)
		@set_username=name
		
	end

	def get_id_
		id_soundcloud
	end

end

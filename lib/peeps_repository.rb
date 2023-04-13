require_relative "./peeps"

class PeepsRepository
	def all
		#list all peep messages
		peeps = []
		
		# Send the SQL query and get the result set.
		sql = 'SELECT id, peep, time, user_id FROM peeps;'
		result_set = DatabaseConnection.exec_params(sql, [])

		result_set.each do |record|

			repo = Peeps.new
			repo.id = record['id'].to_i
			repo.peep = record['peep']
			repo.time = record['time']
			repo.user_id = record['user_id']

			peeps << repo
		end

		return peeps
	end

end
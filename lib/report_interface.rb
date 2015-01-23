class ReportInterface

  def no_time
    puts "No billed time for this month."
  end

	def print_employee_projects(projects)
    no_time if projects.length == 0
    projects.each {|project_type, hours| puts "Project: #{project_type}, Hours: #{hours}"}
  end

  def print_all_employee_details(projects)
    no_time if projects.empty?
    projects.each {|employee_row| puts "Employee: #{employee_row[:username]}, Project: #{employee_row[:project_type]}, Hours: #{employee_row[:hours]}, Date: #{employee_row[:year]}/#{employee_row[:month]}/#{employee_row[:day]}"}
  end

  def print_details(projects)
    no_time if projects.all? {|array| array.empty?} 
    projects.each {|project_array| projects.delete(project_array) if project_array.empty?}
    
    projects.each do |project_row|
      project_row.each {|line| puts "#{line[:project_type]}, Hours: #{line[:hours]}, Date: #{line[:year]}/#{line[:month]}/#{line[:day]}"}
    end
  end

  def print_client_totals(projects)
    no_time if projects.length == 0
    projects.each {|project_type, hours| puts "Client: #{project_type}, Hours: #{hours}"}
  end
end
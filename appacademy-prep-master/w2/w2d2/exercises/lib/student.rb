class Student
  attr_accessor :first_name, :last_name, :courses
  
  def initialize(first,last)
    @first_name = first
    @last_name = last
    @courses = []
  end
  
  def name
    "#{@first_name} #{@last_name}"
  end
  
  def has_conflict?(course)
    self.courses.each {|current_course| return true if current_course.conflicts_with?(course)}
    return false
  end
  
  def enroll(course)
    raise "Conflicts with student schedule!" if has_conflict?(course)
    @courses.push(course) unless @courses.include?(course)
    
    course.students << self
  end
  
  def course_load
    department_list = Hash.new(0)
    self.courses.each do |course|
      department_list[course.department] += course.credits
    end
    department_list
  end
end
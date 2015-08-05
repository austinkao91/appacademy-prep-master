class Student
  attr_accessor :first_name, :last_name, :courses
  attr_accessor :department_list
  
  def initialize(first,last)
    @first_name = first
    @last_name = last
    @courses = []
    @department_list = Hash.new(0)
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
    course.students.push(self)
  end
  
  def course_load
    self.courses.each do |course|
      @department_list[course.department] += course.credits
    end
    @department_list
  end
end
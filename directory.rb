def input_students
  # create an empty array
  students = []
  puts "Please enter Student Information"
  puts "To finish, just hit return twice"
  # get the first name
  puts "Please enter Name"
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # prompt for cohort, default to November if empty
    puts "Please enter Cohort, default is November"
    cohort = gets.chomp
    nameandco = {:name => name, :cohort => cohort}
    if nameandco[:cohort] == ""
      nameandco[:cohort] = "November"
    end
    # add information to students array
    students << {name: nameandco[:name], cohort: nameandco[:cohort], hobbies: :football, height: :height, country: :country}
    puts "Now we have #{students.count} students"
    # get another name from the suer
    puts "Please enter another name"
    name = gets.chomp
  end
  # return the array of input_students
    return students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}".center(50)
    puts "Cohort: #{student[:cohort]}".center(50)
    puts "Height: #{:height}".center(50)
    puts "Country: #{:country}".center(50)
    puts "Hobbies: #{:hobbies}\n".center(50)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def student_cohorts(students)
  puts "Enter a Cohort Date"
  input = gets.chomp
  students.each do |student, index|
    if student[:cohort] == input
      puts student[:name]
    end
  end
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
student_cohorts(students)

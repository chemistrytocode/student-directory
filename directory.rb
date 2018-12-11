def interactive_menu
  students = []
  loop do
    puts "1. Input the Students"
    puts "2. Show the Students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
      puts "I don't know what you meant, try again"
    end
  end
end

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
    students << {name: nameandco[:name], cohort: nameandco[:cohort]}
    # check for plurals
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
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
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

def student_cohorts(students)
  puts "Enter a Cohort Date to search"
  input = gets.chomp
  students.each do |student, index|
    if student[:cohort] == input
      puts student[:name]
    end
  end
end


#nothing happens until we call the methods
interactive_menu

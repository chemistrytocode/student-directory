@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
    puts "I don't know what you meant, try again"
  end
end


def print_menu
  puts "1. Input the Students"
  puts "2. Show the Students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def input_students
  # create an empty array
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
    @students << {name: nameandco[:name], cohort: nameandco[:cohort]}
    # check for plurals
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the suer
    puts "Please enter another name"
    name = gets.chomp
  end
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}".center(50)
    puts "Cohort: #{student[:cohort]}".center(50)
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def student_cohorts
  puts "Enter a Cohort Date to search"
  input = gets.chomp
  @students.each do |student, index|
    if student[:cohort] == input
      puts student[:name]
    end
  end
end


#nothing happens until we call the methods
interactive_menu

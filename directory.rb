@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_prompt
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_prompt
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
end

def input_students
  name = input_prompt
  while !name.empty? do
    add_to_hash(name, :november)
      puts "Now we have #{@students.count} students"
      name = input_prompt
  end
  puts "#{@students.count} have been added"
end

def add_to_hash(name, cohort)
  @students << {name: name, cohort: cohort}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "File Save Successful! \n"
end

# LOADING METHODS START
# Prompts the user for an input, defaults to students.csv"
def load_prompt
  puts "Enter file to load, leave empty to load default"
  filename = gets.chomp
  if filename == ""
    filename = "students.csv"
  end
  check_load_file(filename)
end

# Checks if argument file is valid
def check_load_file(filename)
    if File.exists?(filename) # if it exists
      load_students(filename)
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end
end

# Loads students
def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_to_hash(name, cohort.to_sym)
  end
  file.close
  puts "Loaded #{@students.count} from #{filename}"
end

# Load from command line
def initial_load_students
  filename = ARGV.first# first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    puts "No data loaded, create a new list or load from menu"
  else
    check_load_file(filename)
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

initial_load_students
interactive_menu

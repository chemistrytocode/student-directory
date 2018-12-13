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
  puts "3. Save the list to a location"
  puts "4. Load the list from a location"
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
    load_students
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

# SAVING METHODS START
# Prompt the user for save location
def save_prompt
  puts "Enter a save location for this file"
  puts "Leave empty to save to default"
  filename = gets.chomp
    if filename == "" || nil
      filename = "students.csv"
    else
      filename
    end
end

# Save the file
def save_students
  filename = save_prompt
  # open the file for writing
  File.open(filename, "w") do |student_list|
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      student_list.puts csv_line
      end
    end
end

# LOADING METHODS START
# Prompts the user for an input, defaults to students.csv"
def load_prompt
  puts "Enter file to load, leave empty to load default"
  filename = gets.chomp
  if filename == ""
    filename = "students.csv"
  end
  return filename
end

# Checks if argument file is valid
def check_load_file(filename)
    puts filename
    if File.exists?(filename) # if file doesn't exist
      puts "Loading from #{filename}..."
    else
      puts "Sorry, #{filename} doesn't exist."
      interactive_menu
    end
end

# Loads students
def load_students
  filename = load_prompt
  check_load_file(filename)
  File.open(filename, "r") do |student_list|
    student_list.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_to_hash(name, cohort.to_sym)
    end
  end
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

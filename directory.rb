def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    students << {name: name, cohort: :november, hobbies: :football, height: :height, country: :country}
    puts "Now we have #{students.count} students"
    # get another name from the suer
    name = gets.chomp
    # return the array of input_students
  end
    return students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}".center(50)
    puts "Cohort:#{student[:cohort]}".center(50)
    puts "Height: #{:height}".center(50)
    puts "Country: #{:country}".center(50)
    puts "Hobbies: #{:hobbies}\n".center(50)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

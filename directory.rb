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
    nameandco = [] << name
    # prompt for cohort, default to November if empty
    puts "Please enter Cohort, default is November"
    nameandco << cohort = gets.chomp
    if nameandco[1] == ""
      nameandco[1] = "November"
    end
    # add information to students array
    students << {name: nameandco[0], cohort: nameandco[1], hobbies: :football, height: :height, country: :country}
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

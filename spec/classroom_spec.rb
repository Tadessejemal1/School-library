require 'spec_helper'

describe Classroom do
  context 'It should add a classroom' do
    classroom = Classroom.new('Maths')

    it 'classroom should be an instance of class Classroom' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'should add new student to classroom' do
      classroom.add_student(Student.new(id: 1782, age: 20, classroom: nil, name: 'Tadesse',
                                        parent_permission: true))
    end
  end
end

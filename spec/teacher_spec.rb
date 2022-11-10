require 'spec_helper'

describe Teacher do
  context 'It should add a teacher' do
    teacher = Teacher.new(id: 2348, specialization: 'Maths', age: 27, name: 'tewodro', parent_permission: true)

    it 'teacher should be an instance of class Teacher' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'creates a teacher with permission' do
      expect(teacher.can_use_services?).to eq true
    end

    it 'should validates name, age and specialisation of Teacher' do
      expect(teacher.id).to eql(2348)
      expect(teacher.name).to eql('tewodro')
      expect(teacher.age).to eql(27)
      expect(teacher.specialization).to eql('Maths')
    end
  end
end

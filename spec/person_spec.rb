require 'spec_helper'

describe Person do
    context 'It should add a person' do
      person = Person.new(id: 282, age: 28, name: 'Tadesse', parent_permission: true)
      person2 = Person.new(id: 282, age: 28, name: 'Tadesse', parent_permission: false)
  
      it 'should be an instance of class Person' do
        expect(person).to be_an_instance_of(Person)
      end
  
      it 'should validates name of Person' do
        expect(person.name).to eq('Tadesse')
      end
  
      it 'should check age of Person' do
        expect(person.age).to eq(28)
      end
  
      it 'should return true if can_use_services? = true' do
        expect(person.can_use_services?).to eq true
      end
  
      it 'should return true if can_use_services? = false' do
        expect(person2.can_use_services?).to eq false
      end
    end
end
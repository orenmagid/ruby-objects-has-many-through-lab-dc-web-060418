require 'pry'

class Patient
  attr_accessor :name
  @@all = []

  def all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end

  def doctors
    self.appointments.collect do |appointment|
      appointment.doctor
    end
  end

end

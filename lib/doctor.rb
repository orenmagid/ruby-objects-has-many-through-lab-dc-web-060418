require 'pry'

class Doctor
  attr_accessor :name, :appointment, :patient

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def patients
    Appointment.all.collect do |appointment|
      if appointment.doctor == self
        appointment.patient
      end
    end
  end

end

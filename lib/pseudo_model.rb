# encoding: utf-8



require 'pseudo_model/version'



# PseudoModel
# A class that pretends to be an active record model, useful for mockups.
class PseudoModel
  rails_methods = %w[object_id respond_to? hash eql? equal? == send class inspect is_a? kind_of? to_yaml].map{|n|[n,n.to_sym]}.flatten
  (Object.instance_methods - Object.instance_methods.grep(/^__/) - rails_methods).each do |m|
    undef_method m
  end

  extend ActiveModel::Naming

  def to_model
    self
  end

  def valid?()      true end
  def new_record?() true end
  def destroyed?()  true end

  def errors
    obj = Object.new
    def obj.[](key)         [] end
    def obj.full_messages() [] end
    obj
  end

  def self.find(*)
    new
  end

  def self.create(attrs={})
    new(attrs)
  end

  attr_reader :attributes
  def initialize(attrs={})
    @attributes = HashWithIndifferentAccess.new(attrs)
  end

  def [](name)
    @attributes[name]
  end

  def []=(name, value)
    @attributes[name] = value
  end

  def respond_to_missing?(name, includeprivate=false)
    true
  end

  def method_missing(name, *args)
    case name.to_s
      when /=$/ # assignment (obj.foo = value)
        @attributes[name.to_s[0..-2]] = args.first
      when /\?$/ # interrogation (obj.foo?)
        raise ArgumentError, "Wrong number of arguments (method: #{name})" unless args.empty?
        !!@attributes[name.to_s[0..-2]]
      when /^[A-Z]\w*/i # reader (obj.foo)
        raise ArgumentError, "Wrong number of arguments (method: #{name})" unless args.empty?
        @attributes[name]
      else
        super
    end
  end

  def save
    true
  end

  def save!
    true
  end
end

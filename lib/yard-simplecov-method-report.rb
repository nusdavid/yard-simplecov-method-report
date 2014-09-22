
begin
  YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'
  require File.join(File.dirname(__FILE__), 'yard-simplecov-method-report', 'handler.rb') if RUBY19
rescue => exception
end


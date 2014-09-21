
require 'multi_json'

module SimpleCov end

module SimpleCov::JSON
  class << self
    def parse(json)
      # Detect and use available MultiJson API - it changed in v1.3
      if MultiJson.respond_to?(:adapter)
        MultiJson.load(json)
      else
        MultiJson.decode(json)
      end
    end
  end
end

require 'pp'

# This class handles define statements
class MethodHandler < YARD::Handlers::Ruby::MethodHandler
  handles :def, :defs

  def initialize(a, b)
    super
    begin
      coverage_file = 'coverage/.resultset.json'
      @coverage = SimpleCov::JSON.parse(File.open(coverage_file).read)
    rescue => exception
      p exception
    end
  end

  def coverage(file, r)
    hits = nil
    begin
      time = @coverage['timestamp']
      full_file_name = File.expand_path(file)
      if @coverage
	hits = Hash.new
	@coverage.each_key do |type|
	  hits[type] = Hash.new
	  all_list = @coverage[type]['coverage'][full_file_name][r]
	  active_list = all_list.compact
	  covered_list = active_list.map { |x| x > 0 ? x : nil }.compact
	  active = active_list.size.to_f
	  covered = covered_list.size.to_f
#	  hits[type][:all_list] = all_list
#	  hits[type][:covered_list] = covered_list
#	  hits[type][:active_list] = active_list
	  hits[type][:active] = active
	  hits[type][:covered] = covered
	  if active > 0
	    hits[type][:percent] = covered / active * 100.0
	  end
	end
      end
    rescue => x
    end
    hits
  end

  # process the define statement
  def process
    begin
      scope = statement.type == :defs ? :class : :instance
      name = statement.method_name(true)
      lname = scope == :instance ? "##{name}" : ".#{name}"
      if obj = YARD::Registry.resolve(namespace, lname)

	if ret = coverage(statement.file, statement.line_range)
	  h = obj[:simplecov] = ret
	end
      end
    rescue => x
      p x
    end

    nil
  rescue Exception => exception
    p exception
  end
end


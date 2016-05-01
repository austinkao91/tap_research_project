class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ENV["tr_auth_key"] = "Y29kZXRlc3RAdGFwcmVzZWFyY2guY29tOjc2YjJlZjAyNjhhOTE3NzkyN2E5NWJkNGRiNGI4ZGJj"
  
  def query_tap_research(path)
    base_url = "http://staging.tapresearch.com/api/v1"
    headers = {"Authorization" => "Basic #{ENV["tr_auth_key"]}"}
    HTTParty.get("#{base_url}#{path}", :headers => headers)
  end

  def format_data(data_set, controller, foreign_key = nil, foreign_class = nil, recursive = true)
    clazz = controller.constantize
    objSet = []
    data_set.each do |data|
      if(foreign_key)
        foreign_key_attribute = foreign_class.split(/(?=[A-Z])/).push("id").join("_").downcase
        data["#{foreign_key_attribute}"] = foreign_key
      end

      valid_attributes = clazz.new.attributes
      filtered_data = parse_data(data, valid_attributes)

      objSet.push(clazz.new(filtered_data))
    end
    objSet
  end

  def cache_data(data_set, controller)
    clazz = controller.constantize
    clazz.import data_set
  end

  def parse_data(data,valid_attributes)
    valid = {}
    data.each do |k,v|
      valid[k] = v if(valid_attributes.has_key?(k))
    end
    valid
  end
end

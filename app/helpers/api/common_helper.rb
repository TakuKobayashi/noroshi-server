module Api::CommonHelper
  def custom_extract(instance, options = {}, *columns)
    attributes = instance.attributes
    result = {id_in_server: attributes["id"]}
    attributes.delete_if{|k, v| k == "id" }
    if columns.blank?
      result.merge!(attributes)
      result.merge!(options)
    else
      columns.each do |column|
        result[column.to_s] = attributes[column.to_s]
      end
      result.merge!(options)
    end
    return Hash[result.map{|k,v| [k, v.kind_of?(Time) ? v.to_i : v] }]
  end
end

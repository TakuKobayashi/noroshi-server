module Api::CommonHelper
  def custom_extract(instance, options = {}, *columns)
    result = {}
    attributes = instance.attributes
    if columns.blank?
      result.merge!(attributes)
      result.merge!(options)
    else
      columns.each do |column|
        result[column.to_s] = attributes[column.to_s]
      end
      result.merge!(options)
    end
    return Hash[result.map{|k,v| [k, v.kind_of?(Time) ? v.to_i * 1000 : v] }]
  end
end

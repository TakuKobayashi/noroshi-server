# coding: utf-8
class JSONInstance
  def self.model_to_hash(model, extra_hash = {})
    hash = Hash[model.attributes.map{|k,v| [k, v.kind_of?(Time) ? v.to_i : v] }]
    hash.merge!({status: "OK"}.merge(extra_hash))
    return hash
  end
end
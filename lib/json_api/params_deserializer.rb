module JSONApi
  class ParamsDeserializer
    def self.deserialize(data)
      self.new.deserialize(data)
    end

    def deserialize(data, **options)
      type = sanitize_type_name(data.fetch('type'))

      attributes    = sanitize_hash(data.fetch('attributes', {}))
      relationships = data.fetch('relationships', {})

      deserialize_relationships(relationships, attributes)

      if options[:root] == false
        attributes
      else
        { type => attributes }
      end
    end

    private

    def deserialize_relationships(relationships, attributes)
      relationships.each do |name, data|
        data = data.fetch('data')
        name = sanitize_attribute_name(name)

        attributes["#{name}_id"]   = data.fetch('id')
        attributes["#{name}_type"] = sanitize_type_name(data.fetch('type'))
      end
    end

    def sanitize_hash(hash)
      hash.map do |key, value|
        value = sanitize_hash(value) if value.is_a?(Hash)
        [sanitize_attribute_name(key), value]
      end.to_h
    end

    def sanitize_attribute_name(attribute_name)
      attribute_name
        .downcase
        .underscore
    end

    def sanitize_type_name(type_name)
      sanitize_attribute_name(type_name)
        .singularize
    end
  end
end
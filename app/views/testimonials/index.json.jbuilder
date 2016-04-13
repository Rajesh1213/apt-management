json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :date_entered, :content
  json.url testimonial_url(testimonial, format: :json)
end

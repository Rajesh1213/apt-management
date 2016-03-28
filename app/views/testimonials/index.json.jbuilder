json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :date, :content
  json.url testimonial_url(testimonial, format: :json)
end

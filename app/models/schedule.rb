class WorkSpan
  include DataMapper::Resource

  # Required properties
  property :id, Serial # An auto-increment integer key
  property :duration, Decimal, :required => true, :default => 0.0
  property :day_of_week, String, :required => true # Full named day (e.g. "Wednesday")
  property :date_created, DateTime, :required => true
  property :date_modified, DateTime, :required => true

  # Optional properties
  property :category, String
  property :sub_category, String

end
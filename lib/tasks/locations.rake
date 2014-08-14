namespace :locations do
  task refresh: :environment do
    Location.refresh!
  end

  task observe: :environment do
    Location.observe!
  end
end

namespace :observations do
  task start: :environment do
    s = Rufus::Scheduler.new

    s.every '10m', first: :now do
      Location.refresh!
      puts "Refreshed #{Location.count} Locations"

      Location.find_each do |location|
        puts "Observing #{location.name}"
        location.observe!
        puts "Found #{location.observations.last.vehicle_observations.count} available vehicles"
      end
    end

    s.join
  end
end

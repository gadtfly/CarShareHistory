every 1.week do
  rake 'locations:refresh'
end

every 10.minutes do
  rake 'locations:observe'
end

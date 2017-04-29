set :output, 'log/crontab.log'

every 1.week , roles: %i(app) do
  rake '-s sitemap:refresh'
end

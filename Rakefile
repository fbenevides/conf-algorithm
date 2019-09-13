require './lib/conferences'

namespace :conferences do
  task :process do
    conference = Conferences::Conference.load(ENV['file'])
    conference.process
    conference.show
  end
end

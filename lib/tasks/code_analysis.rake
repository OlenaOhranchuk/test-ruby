task :code_analysis do
  puts '########## BRAKEMAN ##########'
  sh 'bundle exec brakeman . -z -q'

  puts "\n\n\n"
  puts '########## RUBOCOP ##########'
  sh 'bundle exec rubocop app config lib spec'

  puts "\n\n\n"
  puts '########## REEK ##########'
  sh 'bundle exec reek app config lib'

  puts "\n\n\n"
  puts '########## RAILS BEST PRACTICES ##########'
  sh 'bundle exec rails_best_practices .'
end

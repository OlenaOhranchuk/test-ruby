task :code_analysis do
  sh 'bundle exec rubocop'
  sh 'bundle exec brakeman . -z -q'
end

namespace :util do
  desc 'Setup a default admin user and role'
  task :setup_admin => [ :environment ] do
    # Create admin role
    admin_role = Role.create(:name => 'admin')

    # Create default admin user
    user = User.create do |u|
      u.login = 'admin'
      u.password = u.password_confirmation = 'i<3passwords'
      u.email = APP_CONFIG[:admin_email]
    end

    # Activate user
    user.register!
    user.activate!

    # Add admin role to admin user
    user.roles << admin_role
  end

  desc 'Clear out the log/ and tmp/ directories'
  task :cleanup => [ :environment ] do
    puts 'Clearing logs...'
    Rake::Task['log:clear'].invoke

    puts 'Clearing tmp directory...'
    Rake::Task['tmp:clear'].invoke
  end

  desc 'Reset the database and load all fixtures'
  task :setup_dev_env => [ :environment ] do
    puts 'Resetting database...'
    Rake::Task['db:reset'].invoke

    puts 'Migrating database to current...'
    Rake::Task['db:migrate'].invoke

    puts 'Loading fixtures...'
    Rake::Task['spec:db:fixtures:load'].invoke
  end
end

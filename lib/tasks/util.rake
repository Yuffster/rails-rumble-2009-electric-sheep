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
end

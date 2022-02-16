desc "This task sends monthly emails."
task :monthly_update => :environment do
  if Time.now.day == 16
    users = User.all
    users.each do |user|
      UserMailer.monthly_update(user).deliver_now
    end
  end
end

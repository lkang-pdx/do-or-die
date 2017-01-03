namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    puts "Deleting older items..."
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
    puts "done."
  end
end

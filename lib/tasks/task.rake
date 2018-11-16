# frozen_string_literal:true

namespace :app do

  desc 'Drop exists database and create migration'
  task prepare_db: :environment do
    tasks = %w[db:drop db:create db:migrate db:seed]
    tasks.each { |t| Rake::Task[t].invoke }
  end

  desc 'Create data'
  task create_data: :environment do
    tasks = %w[app:prepare_db app:migrate_images app:create_categories app:create_comments app:create_likes app:create_follows]
    tasks.each { |t| Rake::Task[t].invoke }
  end

  desc 'Add images from folder'
  task migrate_images: :environment do
    Dir.chdir("#{Rails.root}/lib/assets/images/")
    categories = Dir['*'].select { |f| File.directory? f }
    categories.each do |item|
      puts "Create category: #{item}" if Category.create!(title: item, user_id: 1)
      upload_images(item)
    end
  end

  desc 'Create fake comments for images'
  task create_comments: :environment do
    create_comments
  end

  desc 'Create likes for images'
  task create_likes: :environment do
    create_likes
  end

  desc 'Create follows for categories'
  task create_follows: :environment do
    create_follows
  end

  desc 'Create fake categories'
  task create_categories: :environment do
    create_fake_categories
  end

  def upload_images(category_title)
    Dir.chdir("#{Rails.root.to_s}/lib/assets/images/#{category_title}")
    image_paths = Dir['*.*']
    category = Category.find_by(title: category_title)

    image_paths.each_with_index do |img_path, i|
      file_img = File.open(img_path)
      puts "\tUpload #{File.basename(img_path)}" if Image.create!(name: ('d_img_' + (i + 1).to_s),
      picture: file_img,
      user_id: 1,
      category_id: category.id)
      file_img.close
    end
  end

  def create_comments
    300.times do
      Comment.create!(user_id: User.first.id,
      image_id: rand(1..75),
      body: Faker::Lorem.sentence(15, true).chop)
    end
    puts 'Create comments..................................................................................'
  end

  def create_likes
    img_id = 1
    20.times do
      Heart.create!(user_id: User.first.id,
                    image_id: img_id)
      puts 'Create likes.....................................................................................'
      img_id += 2
    end
  end

  def create_follows
    ctg_id = 1
    10.times do
      Follow.create!(followable_type: Category,
                     followable_id: ctg_id,
                     follower_type: User,
                     follower_id: 1)
      puts 'Create follows...................................................................................'
      ctg_id += 2
    end
  end

  def create_fake_categories
    15.times do
      category = Category.create!(title: Faker::Book.title,
                                  user: User.first)
      puts "Create Categories: #{category.title}"
    end
  end
end

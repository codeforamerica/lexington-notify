desc "Rename this application"
task :rename, [:name] => :environment do |t, args|
  Dir.glob(%w(rb yml).map{ |ext| Rails.root.join("**/*.#{ext}") }).each do |path|
    renamed = File.read(path).gsub(/CivicRails/, args.name).gsub(/civic_rails/, args.name.underscore)
    File.write(path, renamed)
  end
end

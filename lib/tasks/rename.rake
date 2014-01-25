desc "Rename this application"
task :rename, [:name] => :environment do |t, args|
  Dir.glob(%w(rb yml).map{ |ext| Rails.root.join("**/*.#{ext}") }).each do |path|
    before = Rails.application.class.name.split('::').first
    after = args.name or raise "Pass a new name as an argument: $ rake rename[MyCivicApp]"

    # Swap in the new name
    renamed = File.read(path).gsub(/#{before}/, after).gsub(/#{before.underscore}/, after.underscore)

    # Write the updated contents back to the file
    File.write(path, renamed)
  end
end

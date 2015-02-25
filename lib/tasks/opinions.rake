namespace :opinions do
  desc 'Dump current month opinions to results.json'
  task :dump => :environment do
    opinions = SiteParser.call

    File.open('results.json', 'w') do |f|
      f.write opinions.to_json
    end

    puts "Yay! JSON file results.json created successfully"
  end
end

require 'open-uri'
if Rails.env.development?
  Dose.destroy_all
  Ingredient.destroy_all
  Cocktail.destroy_all
end

url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"
repo = open(url).read
p recipes = JSON.parse(repo)

recipes.each do |cocktail|
  c = Cocktail.create!(name: cocktail["name"], description: cocktail["preparation"])
  cocktail["ingredients"].each do |ingredient|
    if ingredient["ingredient"]
      i = Ingredient.find_or_create_by(name: ingredient["ingredient"])
      d = Dose.create(description: ingredient["amount"].to_s + " " + ingredient["unit"], cocktail: c, ingredient: i)
      puts "Added #{d.description} of #{i.name} to #{c.name}! How to make it: #{c.description}"
    end
  end
end

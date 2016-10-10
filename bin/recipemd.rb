require 'json'
require 'fileutils'
require "base64"


def write_photo_data_at_path(photo_destination, data)
  File.open photo_destination, "wb" do |f|
    f.write Base64.decode64(data)     
  end
end

def convert_recipe(recipe)
  recipe_hash = JSON.parse(File.read(recipe))
  filename = File.basename(recipe)

  md_filename, photo_path = if recipe_hash["photos"].length > 0 || recipe_hash["photo_data"].to_s != ""
                              package_path = File.join(File.dirname(recipe), "#{filename}.recipepackage")
                              FileUtils.mkdir_p(package_path)
                              photos_dir = File.join(package_path, "Photos")
                              FileUtils.mkdir_p(photos_dir)
                              recipe_filename = File.join(package_path, "#{filename}.recipe")
                              [recipe_filename, photos_dir]
                            else
                              ["#{recipe}.recipe", nil]
                            end

  File.open md_filename, 'w' do |md|
    md.write "# "; md.write recipe_hash["name"]

    if recipe_hash["source_url"].to_s != ""
      md.puts " | [#{recipe_hash["source"].to_s != "" ? recipe_hash["source"] : recipe_hash["source_url"]}](#{recipe_hash["source_url"]})" 
    elsif recipe_hash["source"].to_s != ""
      md.write " | "; md.puts recipe_hash["source"]
    end

    md.puts "\n"
    rating = if recipe_hash["rating"] > 0
               star_rating = "★" * recipe_hash["rating"] + "☆" * 5
               star_rating.slice(0, 5)
             else
               "(unrated)"
             end
    md.write "> Rating: "; md.puts rating
    md.puts "> Prep Time: #{recipe_hash["prep_time"]}  " if recipe_hash["prep_time"].to_s != ""
    md.puts "> Cook Time: #{recipe_hash["cook_time"]}  " if recipe_hash["cook_time"].to_s != ""
    md.puts "> Total Time: #{recipe_hash["total_time"]}  " if recipe_hash["total_time"].to_s != ""
    md.puts "\n"

    if recipe_hash["description"].to_s != ""
      md.puts "## Description"
      md.write "> "; md.puts recipe_hash["description"]
      md.puts "\n"
    end
    md.puts "## Ingredients"
    md.puts recipe_hash["ingredients"].gsub(/^/, '- ')
    md.puts "\n"
    md.puts "## Directions"
    md.puts recipe_hash["directions"]
    md.puts "\n"

    if recipe_hash["notes"] != ""
      md.puts "## Notes"
      md.write "> "; md.puts recipe_hash["notes"]
    end
    md.puts "\n"


    if recipe_hash["servings"].to_s != "" || recipe_hash["nutritional_info"].to_s != ""
      md.puts "# Nutritional Info"

      if recipe_hash["servings"].to_s != ""
        md.write "> Servings: "; md.puts recipe_hash["servings"]
        md.puts "\n"
      end

      if recipe_hash["nutritional_info"].to_s != ""
        md.puts recipe_hash["nutritional_info"].gsub(/^/, '> ')
        md.puts "\n"
      end
    end

    if photo_path
      md.puts "## Photos"
      if recipe_hash["photo_data"].to_s != ""
        write_photo_data_at_path(File.join(photo_path, recipe_hash["photo"]), recipe_hash["photo_data"])
        md.write "![Main Photo](./Photos/"; md.write recipe_hash["photo"]; md.puts ")"
      end
      recipe_hash["photos"].each do |photo|
        photo_destination = File.join(photo_path, photo["filename"])
        write_photo_data_at_path photo_destination, recipe_hash["photo_data"]
        md.puts "![#{photo["name"]}](./Photos/#{photo["filename"]})"
        md.puts "\n"
      end
    end
  end
end

file_path = ARGV.first
convert_recipe(file_path)

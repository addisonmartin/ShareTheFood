# frozen_string_literal: true

class DonationDecorator < ApplicationDecorator
  delegate_all

  # Used to display the Donation's image in the card from the index view.
  def card_image
    if model.images.attached?
      h.image_tag(model.images.first, class: 'card-img-top')
    end
  end

  def allergen_information
    allergen_information = 'Contains: '

    allergen_information += 'Gluten, ' if model.contains_gluten
    allergen_information += 'Peanuts, ' if model.contains_peanuts
    allergen_information += 'Tree Nuts, ' if model.contains_tree_nuts
    allergen_information += 'Dairy, ' if model.contains_dairy
    allergen_information += 'Soy, ' if model.contains_soy
    allergen_information += 'Egg, ' if model.contains_egg
    allergen_information += 'Fish, ' if model.contains_fish
    allergen_information += 'Shellfish, ' if model.contains_shellfish

    # If no allergen information was added above, remove the contains and indicate the Donation contains no common allergens.
    if allergen_information == 'Contains: '
      allergen_information = 'Contains No Common Allergens'
    end

    # Strip the trailing space.
    allergen_information = allergen_information.strip
    # Strip the trailing comma.
    if allergen_information[allergen_information.length - 1] == ','
      allergen_information = allergen_information[0, allergen_information.length - 1]
    end

    allergen_information
  end
end

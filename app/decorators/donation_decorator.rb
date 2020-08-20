# frozen_string_literal: true

class DonationDecorator < ApplicationDecorator
  delegate_all

  def image_for_card
    h.image_tag(model.images.first.variant(resize_to_limit: [250, 250]), class: 'card-img-top', alt: "#{model.name}'s Image") if model.images.attached?
  end

  def allergen_information
    allergen_text = 'May Contain: '

    allergen_text += 'Peanuts, ' if model.contains_peanuts?
    allergen_text += 'Tree Nuts, ' if model.contains_tree_nuts?
    allergen_text += 'Dairy, ' if model.contains_dairy?
    allergen_text += 'Soy, ' if model.contains_soy?
    allergen_text += 'Egg, ' if model.contains_egg?
    allergen_text += 'Fish, ' if model.contains_fish?
    allergen_text += 'Shellfish, ' if model.contains_shellfish?

    allergen_text = 'Likely Contains No Common Allergens' if allergen_text == 'May Contain: '

    # Remove any trailing spaces.
    allergen_text = allergen_text.strip

    # Remove any trailing commas.
    allergen_text = allergen_text[0, allergen_text.length - 1] if allergen_text[allergen_text.length - 1] == ','

    allergen_text
  end

  def dietary_restrictions_badges
    badges = ''

    if model.is_vegetarian?
      badges += h.content_tag(:span, class: 'badge badge-pill badge-primary ml-1') do
        'Vegetarian'
      end
    end
    if model.is_vegan?
      badges += h.content_tag(:span, class: 'badge badge-pill badge-primary ml-1') do
        'Vegan'
      end
    end
    if model.is_kosher?
      badges += h.content_tag(:span, class: 'badge badge-pill badge-primary ml-1') do
        'Kosher'
      end
    end
    if model.is_halal?
      badges += h.content_tag(:span, class: 'badge badge-pill badge-primary ml-1') do
        'Halal'
      end
    end
    unless model.contains_gluten?
      badges += h.content_tag(:span, class: 'badge badge-pill badge-primary ml-1') do
        'Gluten Free'
      end
    end

    badges.html_safe
  end

  def available_until_in_words
    h.distance_of_time_in_words(h.local_time(model.available_until), h.local_time(Time.zone.now))
  end
end

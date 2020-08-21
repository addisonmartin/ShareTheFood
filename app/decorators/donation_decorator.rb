# frozen_string_literal: true

class DonationDecorator < ApplicationDecorator
  delegate_all

  def image_for_card
    if model.images.attached?
      h.image_tag(model.images.first.variant(resize_to_limit: [250, 250]), class: 'card-img-top',
                                                                           alt: "#{model.name}'s Image")
    end
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

    badges += dietary_restriction_badge('Vegetarian') if model.is_vegetarian?
    badges += dietary_restriction_badge('Vegan') if model.is_vegan?
    badges += dietary_restriction_badge('Kosher') if model.is_kosher?
    badges += dietary_restriction_badge('Halal') if model.is_halal?
    badges += dietary_restriction_badge('Gluten Free') unless model.contains_gluten?

    badges.html_safe
  end

  def available_until_in_words
    h.distance_of_time_in_words(h.local_time(model.available_until), h.local_time(Time.zone.now))
  end

  private

  DIETARY_RESTRICTION_DESCRIPTION = {
    'Vegetarian': 'asdf',
    'Vegan': 'asdf',
    'Kosher': 'asdf',
    'Halal': 'Halal refers to meat that must abide by these restrictions: An animal should not be dead prior to
              slaughter. A Muslim should perform slaughter. Any flowing blood of the carcass should be completely
              drained.',
    'Gluten Free': 'asdf'
  }.freeze

  def dietary_restriction_badge(name)
    h.tag.span(name, class: 'badge badge-pill badge-primary ml-1', "data-toggle": 'tooltip',
                     "data-placement": 'bottom', title: DIETARY_RESTRICTION_DESCRIPTION[name.to_sym])
  end
end

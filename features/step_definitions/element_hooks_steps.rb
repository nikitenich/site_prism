# frozen_string_literal: true

Then('I should see hidden text by before hook') do
  @test_site.appearing.tap do |page|
    aggregate_failures do
      expect(page.has_will_become_visible?).to be_truthy, 'Element not visible after hovering container when calling from existence method'
      page.h1.hover # make element invisible again
      expect(page.will_become_visible.text).to eq('Text that only visible after hovering container'),
                                               'Element not visible after hovering container when calling element itself'
    end
  end
end

Then('I should receive transformed text instead of element') do
  @test_site.appearing.always_visible_text.tap do |transformed_text|
    aggregate_failures do
      expect(transformed_text).to be_a(String)
      expect(transformed_text).to eq('visible text')
    end
  end
end

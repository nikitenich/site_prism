# frozen_string_literal: true

class Appearing < SitePrism::Page
  set_url '/appearing.htm'
  set_url_matcher(/appearing\.htm$/)

  element :h1, 'h1'
  element :container, '#container'
  # @!method will_become_visible
  # @return [Capybara::Node::Element]
  element :will_become_visible, '#will_become_visible'
  element_before_hook(:will_become_visible) { container.hover }
  # @!method always_visible_text
  # @return [String]
  element :always_visible_text, '#alwaysVisibleText'
  element_after_hook(:always_visible_text) { |element| element.text.gsub('Always', '').strip }
end
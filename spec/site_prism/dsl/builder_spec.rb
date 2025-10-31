# frozen_string_literal: true

describe SitePrism::DSL::Builder do
  let(:invalid_dsl_prefix) do
    Class.new(SitePrism::Page) do
      element :no_at_start, '.foo'
    end
  end
  let(:invalid_dsl_suffix) do
    Class.new(SitePrism::Page) do
      element :underscore_at_end_, '.foo'
    end
  end
  let(:invalid_dsl_characters) do
    Class.new(SitePrism::Page) do
      element :Im_starting_with_UPpErCASE, '.foo'
    end
  end
  let(:blacklisted_name) do
    Class.new(SitePrism::Page) do
      element :attributes, '.foo'
    end
  end
  let(:before_hook_without_block) do
    Class.new(SitePrism::Page) do
      element :foo, '.foo'
      before_hook(:foo)
    end
  end
  let(:after_hook_without_block) do
    Class.new(SitePrism::Page) do
      element :foo, '.foo'
      after_hook(:foo)
    end
  end

  it 'does not build pages with invalid DSL prefixes' do
    expect { invalid_dsl_prefix }.to raise_error(SitePrism::InvalidDSLNameError)
  end

  it 'does not build pages with invalid DSL suffixes' do
    expect { invalid_dsl_suffix }.to raise_error(SitePrism::InvalidDSLNameError)
  end

  it 'does not build pages with names that are not snake_cased' do
    expect { invalid_dsl_characters }.to raise_error(SitePrism::InvalidDSLNameError)
  end

  it 'does not build pages with blacklisted DSL names' do
    expect { blacklisted_name }.to raise_error(SitePrism::InvalidDSLNameError)
  end

  it 'does not allow before hooks without block' do
    expect { before_hook_without_block }.to raise_error(SitePrism::MissingBlockError)
  end

  it 'does not allow after hooks without block' do
    expect { after_hook_without_block }.to raise_error(SitePrism::MissingBlockError)
  end
end

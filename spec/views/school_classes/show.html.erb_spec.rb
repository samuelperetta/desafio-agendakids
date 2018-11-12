require 'rails_helper'

RSpec.describe "school_classes/show", type: :view do
  before(:each) do
    @school_class = assign(:school_class, SchoolClass.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

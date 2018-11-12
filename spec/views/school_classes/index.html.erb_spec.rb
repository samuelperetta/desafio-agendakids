require 'rails_helper'

RSpec.describe "school_classes/index", type: :view do
  before(:each) do
    assign(:school_classes, [
      SchoolClass.create!(),
      SchoolClass.create!()
    ])
  end

  it "renders a list of school_classes" do
    render
  end
end

require 'rails_helper'

RSpec.describe "school_classes/new", type: :view do
  before(:each) do
    assign(:school_class, SchoolClass.new())
  end

  it "renders new school_class form" do
    render

    assert_select "form[action=?][method=?]", school_classes_path, "post" do
    end
  end
end

require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :first_name => "MyString",
      :last_name => "MyString",
      :company => "MyString",
      :job_title => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
      assert_select "input#contact_first_name[name=?]", "contact[first_name]"
      assert_select "input#contact_last_name[name=?]", "contact[last_name]"
      assert_select "input#contact_company[name=?]", "contact[company]"
      assert_select "input#contact_job_title[name=?]", "contact[job_title]"
      assert_select "input#contact_phone[name=?]", "contact[phone]"
      assert_select "input#contact_email[name=?]", "contact[email]"
      assert_select "input#contact_user_id[name=?]", "contact[user_id]"
    end
  end
end

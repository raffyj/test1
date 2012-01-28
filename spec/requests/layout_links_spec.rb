﻿require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
	response.should have_selector('title', :content => "HOME")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
	response.should have_selector('title', :content => "CONTACT")
  end
  
  it "should have an About page at '/about'" do
    get '/about'
	response.should have_selector('title', :content => "ABOUT")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
	response.should have_selector('title', :content => "HELP")
  end

  it "should have a Signup page at '/signup'" do
    get '/signup'
	response.should have_selector('title', :content => "SIGN UP")
  end

  it "should have a Signin page at '/signin'" do
    get '/signin'
	response.should have_selector('title', :content => "Sign in")
  end

  it "should have the right links on  the layout" do
    visit root_path
	response.should have_selector('title', :content => "HOME")
	click_link "About"
	response.should have_selector('title', :content => "ABOUT")
	click_link "Contact"
	response.should have_selector('title', :content => "CONTACT")	
	click_link "Home"
	response.should have_selector('title', :content => "ABOUT")
	click_link "Sign up now!"
	response.should have_selector('title', :content => "SIGN UP")
	
	response.should have_selector('a[href="/"]>img')
  end
  
end


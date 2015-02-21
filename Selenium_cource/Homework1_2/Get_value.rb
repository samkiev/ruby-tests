
module Get_value


#Get ID User Method
    def get_user_id(browser)
      browser.find_element(class: "active").attribute("href")[-5, 5]
    end

#Get Project New User ID method
    def get_project_user_id(browser)
      browser.find_element(class: "even").attribute("id")[-5, 5]
    end

#Get issue ID
    def get_issue_id(browser)
    browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
    end
end
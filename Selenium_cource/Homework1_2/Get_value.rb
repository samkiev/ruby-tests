
module Get_value


#Get ID User Method
    def get_user_id
      id_user = $browser.find_element(class: "active").attribute("href")[-5, 5]
      return id_user
    end


#Get Project New User ID method
    def get_project_user_id
      project_user_id = $browser.find_element(class: "even").attribute("id")[-5, 5]
      return project_user_id
    end

#Get text for Verification of change roles

      def check_role_user_message(message, project_user_id)
        $browser.find_element(id: "member-#{project_user_id}-roles").text.include? message
      end

      #Get issue ID
        def get_issue_id
          issue_id_bug = $browser.find_element(css: "#flash_notice > a").attribute("href")[-5, 5]
        end
end
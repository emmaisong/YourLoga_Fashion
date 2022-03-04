*** Settings ***
Library  SeleniumLibrary
Library  FakerLibrary



*** Variables ***
${URL}  http://automationpractice.com/index.php
${PRODUCT_URL}  http://automationpractice.com/index.php?controller=authentication&back=my-account
${BROWSER}   CHROME
${SIGNIN_LINK}  xpath://*[@id="header"]/div[2]/div/div/nav/div[1]/a
${REGISTRATION_EMAIL_FIELD}  id:email_create
${REGISTRATION_EMAIL}  xpath://input[@type="text"][@id="email_create"]
${CREATE_ACCOUNT_BUTTON}  xpath://span[normalize-space()='Create an account']
${CUSTOMER_GENDER}  name:id_gender
${CUSTOMER_FIRSTNAME}  id:customer_firstname
${CUSTOMER_LASTNAME}  xpath://input[@id="customer_lastname"][@type="text"]
${CUSTOMER_PASSWORD}  id:passwd
${BIRTH_DAY}  xpath://*[@id="days"][@name="days"]
${BIRTH_MONTH}  xpath://*[@id="months"][@name="months"]
${BIRTH_YEAR}   xpath://*[@id="years"][@name="years"]
${CLICK_CHECKBOX}  xpath://input[@type="checkbox"][@name="newsletter"]
${SPECIAL_OFFERS}  xpath://input[@type="checkbox"][@name="optin"]
${COMPANY_NAME}  xpath://input[@type="text"][@name="company"]
${COMPANY_ADDRESS}  xpath://input[@type="text"][@id="address1"]
${COMPANY_CITY}  xpath://input[@type="text"][@id="city"]
${COMPANY_STATE}  xpath://*[@name="id_state"][@id="id_state"]
${ZIP_CODE}  xpath://input[@id="postcode"][@name="postcode"]
${ADDITIONAL_INFORMATION}  xpath://*[@name="other"][@id="other"]
${ADDITIONAL_TEXT}  More interested in great fashion and fashion aficionados
${HOME_PHONE}  //input[@type="text"][@id="phone"]
${MOBILE_PHONE}  //input[@name="phone_mobile"][@id="phone_mobile"]
${ADDRESS_ALIAS}  xpath://input[@type="text"][@id="alias"]
${REGISTER_BUTTON}  xpath://*[@id="submitAccount"]/span
${USER_NAME}  xpath://input[@type="text"][@id="email"]
${USER_PASSWORD}   xpath://input[@type="password"][@id="passwd"]
${USER_SIGNIN}  xpath://span[normalize-space()='Sign in']
${ACCOUNT_CREATED}  xpath://i[@class='icon-home']
${SIGNOUT_BUTTON}  xpath://a[@title='Log me out']
${WOMEN_PRODUCT}  xpath://a[@title='Women']
${PASSWORD_TEXT}  Inkgrave200
${USERNAME_TEXT}  dongdin@mailinator.com
${MOBILE_NUMBER}  0403611366
${WOMEN_PAGE}  xpath://h2[normalize-space()='Women']
${TOPS_BUTTON}  xpath://div[@id='categories_block_left']//li[1]//span[1]
${DRESSES_BUTTON}  xpath://div[@class='block_content']//li[@class='last']//span[@class='grower CLOSE']
${T-SHIRT_BUTTON}  xpath://*[@id="categories_block_left"]/div/ul/li[1]/ul/li[1]/a
${SMALL_SIZE}  name:layered_id_attribute_group_1
${MEDIUM_SIZE}  id:layered_id_attribute_group_2
${LARGE_SIZE}  id:layered_id_attribute_group_3
${CATALOG}  xpath://*[@id="layered_block_left"]/p


*** Keywords ***
User on Application Homepage
   Open Browser  ${URL}  ${BROWSER}
   Maximize Browser Window

New User Account is created
   Click Element  ${SIGNIN_LINK}
   Wait Until Element is Enabled  ${REGISTRATION_EMAIL_FIELD}  3s
   Click Element  ${REGISTRATION_EMAIL_FIELD}

  ${email}=  FakerLibrary.email
   Log    ${email}
   Set Test Variable  ${email}
   Input Text  ${REGISTRATION_EMAIL}    ${email}
   Click Element  ${CREATE_ACCOUNT_BUTTON}

validate successful account creation
  Wait Until Element Is Enabled  ${CUSTOMER_GENDER}  2s
  Click Element  ${CUSTOMER_GENDER}
  ${First name}=  FakerLibrary.First name
   Log    ${First name}
   Set Test Variable  ${First name}
   Input Text  ${CUSTOMER_FIRSTNAME}    ${First name}

  ${Last name}=  FakerLibrary.Last name
   Log    ${Last name}
   Set Test Variable  ${Last name}
   Input Text  ${CUSTOMER_LASTNAME}    ${Last name}
   Input Text  ${CUSTOMER_PASSWORD}   ${PASSWORD_TEXT}

   Select From List By Index  ${BIRTH_DAY}   2
   Select From List By Index  ${BIRTH_MONTH}  5
   Select From List By Index  ${BIRTH_YEAR}   48

   Click Element  ${CLICK_CHECKBOX}
   Click Element  ${SPECIAL_OFFERS}
   Unselect Checkbox  ${CLICK_CHECKBOX}
   Unselect Checkbox  ${SPECIAL_OFFERS}

   ${Company}=  FakerLibrary.Company
   Log    ${Company}
   Set Test Variable  ${Company}
   Input Text  ${COMPANY_NAME}    ${Company}

   ${Address}=  FakerLibrary.Address
   Log    ${Address}
   Set Test Variable  ${Address}
   Input Text  ${COMPANY_ADDRESS}    ${Address}

   ${City}=  FakerLibrary.City
   Log    ${City}
   Set Test Variable  ${City}
   Input Text  ${COMPANY_CITY}    ${City}
   Select From List By Index  ${COMPANY_STATE}   7

   ${Port Number}=  FakerLibrary.Port Number
   Log    ${Port Number}
   Set Test Variable  ${Port Number}
   Input Text  ${ZIP_CODE}    ${Port Number}
   Input Text  ${ADDITIONAL_INFORMATION}    ${ADDITIONAL_TEXT}
   Input Text  ${MOBILE_PHONE}   ${MOBILE_NUMBER}

  ${Name}=  FakerLibrary.Name
   Log    ${Name}
   Set Test Variable  ${Name}
   Input Text  ${ADDRESS_ALIAS}    ${Name}

new user can sign in
   Click Element  ${REGISTER_BUTTON}
   Input Text  ${CUSTOMER_PASSWORD}   ${PASSWORD_TEXT}
   Click Element  ${REGISTER_BUTTON}
   Wait Until Element Is Enabled  ${SIGNOUT_BUTTON}  3s
   Click Element  ${SIGNOUT_BUTTON}


Enter valid username
  Input Text  ${USER_NAME}  ${USERNAME_TEXT}

Enter valid password
  Input Text  ${USER_PASSWORD}  ${PASSWORD_TEXT}

I click on the sign in button
  Wait Until Element Is Enabled  ${USER_SIGNIN}  3s
  Click Element  ${USER_SIGNIN}

Assert successfull login
  Page Should Contain Element  ${ACCOUNT_CREATED}

Search through Women Products
  Open Browser  ${URL}  ${BROWSER}
  Click Element  ${SIGNIN_LINK}
  Maximize Browser Window
  Input Text  ${USER_NAME}  ${USERNAME_TEXT}
  Input Text  ${USER_PASSWORD}  ${PASSWORD_TEXT}
  Click Element  ${WOMEN_PRODUCT}
  Page Should Contain Element  ${WOMEN_PAGE}
  Click Element  ${TOPS_BUTTON}
  Click Element  ${DRESSES_BUTTON}
  Click Element  ${T-SHIRT_BUTTON}
  Page Should Contain Element  ${CATALOG}
  Select Checkbox  ${SMALL_SIZE}
  Unselect Checkbox  ${SMALL_SIZE}
  Select Checkbox  ${MEDIUM_SIZE}
  Unselect Checkbox  ${MEDIUM_SIZE}
  Select Checkbox  ${LARGE_SIZE}
  Unselect Checkbox  ${LARGE_SIZE}



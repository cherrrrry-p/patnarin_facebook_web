*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${URL}  https://www.facebook.com/
${BROWSER}  chrome
${email}  patnarin_cherry@hotmail.com
${pass}    35988100
${page}  กับข้าวกับปลาโอ Plaocooking
${friend}    Patnarin Uthailert
${group}    แบกเป้เที่ยว

*** Test Cases ***
#---------------------------
#  Test name       |     Keyword        |
Login facebook           Login
Upload ProfilePic        ProfilePic
Follow Page              LikePage
                         LikePost
AddFriend                AddFriend
JoinGroup                JoinGroup
    
*** Keywords ***
Login
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()
    Call Method     ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To    url=${URL}
    # Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Input Text    locator=//input[@id='email']    text=${email}
    Input Password    locator=//input[@id='pass']    password=${pass}
    Sleep    3s
    Click Button    locator=//button[@name='login']
    Sleep    3s
    Wait Until Element Is Visible    locator=//span[contains(text(),'ทดสอบ อัตโนมัติ')]

ProfilePic
    Click Element    locator=//span[contains(text(),'ทดสอบ อัตโนมัติ')]
    Wait Until Element Contains    locator=//h1[contains(text(),'ทดสอบ อัตโนมัติ')]    text=ทดสอบ อัตโนมัติ
    Click Element    locator=//div[@aria-label='อัพเดตรูปโปรไฟล์']
    Sleep    2s
    Choose File    locator=//div[@class='rq0escxv l9j0dhe7 du4w35lb j83agx80 cbu4d94t g5gj957u d2edcug0 hpfvmrgz rj1gh0hx buofh1pr ph5uu5jm b3onmgus e5nlhep0 ecm0bbzt']//input[@class='mkhogb32']   file_path=${CURDIR}/profile.png
    Sleep    3s
    Scroll Element Into View    locator=//div[@aria-label='บันทึก']
    Sleep    3s
    Click Element    locator=//div[@aria-label='บันทึก']
    Sleep    3s

LikePage
    Input Text    locator=//input[@placeholder='ค้นหาบน Facebook:']    text=${page}
    Sleep    3s
    Press Keys    //input[@placeholder='ค้นหาบน Facebook:']    RETURN
    Sleep    3s
    Click link    locator=//a[@aria-label='${page}']
    Sleep    3s
    Click Element    locator=//div[@class='k4urcfbm']//div[@aria-label='ติดตาม']
    Sleep    3s
LikePost
    Scroll Element Into View    locator=//span[contains(text(),'ที่เกี่ยวข้องที่สุด')]
    Sleep    3s
    Click Element    locator=//div[@aria-label='ถูกใจ']

AddFriend
    Input Text    locator=//input[@placeholder='ค้นหาบน Facebook:']    text=${friend}
    Sleep    3s
    Press Keys    //input[@placeholder='ค้นหาบน Facebook:']    RETURN
    Sleep    3s
    Click Link    locator=//a[@aria-label='${friend}']
    Wait Until Element Is Visible    locator=//h1[contains(text(),'${friend}')]
    Click Element    locator=//div[@class='k4urcfbm']//div[@aria-label='เพิ่มเป็นเพื่อน']

JoinGroup
    Input Text    locator=//input[@placeholder='ค้นหาบน Facebook:']    text=${group}
    Sleep    3s
    Press Keys    //input[@placeholder='ค้นหาบน Facebook:']    RETURN
    Sleep    3s
    Click Link    locator=//a[@aria-label='${group}']
    Sleep    3s
    Click Element    locator=//div[@class='f4c7eilb a8c37x1j']//div[@aria-label='เข้าร่วมกลุ่ม']
    Wait Until Element Is Visible    locator=//div[@aria-label='ตอบคำถาม']
    Click Element    xpath://*[@id="mount_0_0"]/div/div[1]/div/div[4]/div/div/div[1]/div/div[2]/div/div/div/div[3]/div[2]/div[1]/div[2]/div/div/div/div/div/div/div/div/div[2]/span/div/label[3]/div[1]
    Click Element    xpath://*[@id="mount_0_0"]/div/div[1]/div/div[4]/div/div/div[1]/div/div[2]/div/div/div/div[3]/div[2]/div[1]/div[2]/div/div/div/div/div/div/div/div/div[2]/span/div/label[4]/div[1]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s
    Click Element    locator=//div[@aria-label='ส่ง']





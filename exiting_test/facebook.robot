*** Settings ***
Library  SeleniumLibrary
Library    OperatingSystem
# Test Teardown  Close Browser

*** Variables ***
${URL}  https://www.facebook.com/
${BROWSER}  chrome
${email}  patnarin_cherry@hotmail.com
${pass}    35988100
${keyword}  กับข้าวกับปลาโอ Plaocooking

*** Test Cases ***
Login facebook
    Login
Upload Profile
    ProfilePic
Like Page
    LikePage

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
# ProfilePic
#     Click Element    locator=//span[contains(text(),'ทดสอบ อัตโนมัติ')]
#     Wait Until Element Contains    locator=//h1[contains(text(),'ทดสอบ อัตโนมัติ')]    text=ทดสอบ อัตโนมัติ
#     Click Element    locator=//div[@aria-label='อัพเดตรูปโปรไฟล์']
#     Sleep    2s
#     # Click element    locator=//div[@aria-label='อัพโหลดรูปภาพ']
#     Choose File    locator=//div[@class='rq0escxv l9j0dhe7 du4w35lb j83agx80 cbu4d94t g5gj957u d2edcug0 hpfvmrgz rj1gh0hx buofh1pr ph5uu5jm b3onmgus e5nlhep0 ecm0bbzt']//input[@class='mkhogb32']   file_path=${CURDIR}/profile.jpg
#     Sleep    3s
#     Scroll Element Into View    locator=//div[@aria-label='บันทึก']
#     Sleep    3s
#     Click Element    locator=//div[@aria-label='บันทึก']
#     Sleep    3s
LikePage
    Input Text    locator=//input[@placeholder='ค้นหาบน Facebook:']    text=${keyword}
    Sleep    3s
    Press Keys    //input[@placeholder='ค้นหาบน Facebook:']    RETURN
    Sleep    3s
    Click Element    locator=//div[@class='nc684nl6']//a[@href='https://www.facebook.com/Plaocooking']
    Sleep    3s
    Click Element    locator=//div[@class='k4urcfbm']//div[@aria-label='ติดตาม']






    





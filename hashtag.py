# -*- coding: utf-8 -*-
"""hashtag.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/15s0dufnM50o3vu2XJB3HUFWbIJeVINQZ
"""
#sudo python3.6 -m pip install
import chromedriver_binary
from selenium import webdriver
import pandas as pd
import time
import sys
import random
#import xlrd
#import pprint
#from selenium.webdriver.support.ui import Select

args = sys.argv
print(args[1] + "のcsvファイルを作成しています。")
print("ページ遷移ごとに" + str(args[2]) + "~" + str(args[3]) + "秒の停止")

#options = webdriver.ChromeOptions()
#options.add_argument('--headless')

try:
    if args[4]:
        print("ブラウザあり")
        driver = webdriver.Chrome()
except:
    print("ブラウザなし")
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    driver = webdriver.Chrome(options=options)

#driver.get('https://www.instagram.com/explore/tags/%E6%97%A5%E3%80%85%E3%81%AE%E7%94%9F%E6%B4%BB/')
#driver.get("https://www.instagram.com/explore/tags/aisuarts/")
basic_url = "https://www.instagram.com/explore/tags/"
additional_url = args[1]
driver.get(basic_url + additional_url + "/")
time.sleep(5)

#pip install chromedriver_binary
#pip install selenium

"""
from bs4 import BeautifulSoup
import pandas as pd
import datetime
import urllib.request
import re
import json
from datetime import datetime
from time import sleep

page_source = driver.page_source
soup = BeautifulSoup(page_source, 'html.parser')

js = soup.find("script", text=re.compile("window._sharedData")).text
da = json.loads(js[js.find("{"):js.rfind("}")+1]);

#df = pd.DataFrame(columns=["id","画像URL","名前"])
"""


"""
#beautifulsoupによる取得、今回は使わない
min_number = 0
for i in range(50):
    try:
        basic = da['entry_data']['TagPage'][0]['graphql']['hashtag']['edge_hashtag_to_media']['edges'][i]['node']['shortcode']
        url = "https://www.instagram.com/p/" + basic +"/"
        day = datetime.fromtimestamp(da['entry_data']['TagPage'][0]['graphql']['hashtag']['edge_hashtag_to_media']['edges'][0]['node']['taken_at_timestamp'])
        day = str(day.year) + "-" + str(day.month) + "-" + str(day.day)
        one_article = pd.Series([day, url],["id","画像URL"])
        df = df.append(one_article, ignore_index=True)
        min_number += 1
    except:
        continue

print(str(min_number) + "以上の投稿があります。")
"""
df = pd.DataFrame(columns=["日付","画像URL","名前"])

timepath = "/html/body/div[3]/div[2]/div/article/div[2]/div[2]/a/time"

#driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
#time.sleep(1)
#32 => down => 50 => down

min_number = 0#beautifulsoupを使わない。

#########行われない
"""
if min_number == 50:
    try:
        driver.find_elements_by_class_name("_9AhH0")[32].click()#24番目
        driver.back()
        time.sleep(random.uniform(int(args[2]), int(args[3])))
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(random.uniform(int(args[2]), int(args[3])))
        driver.find_elements_by_class_name("_9AhH0")[50].click()#47
        point = 0
        driver.find_element_by_css_selector(nextPagerSelector).click()

    except:
        df = pd.DataFrame(columns=["日付","画像URL"])
        try:
            driver.execute_script("window.scrollTo(0, 0);")
            driver.find_elements_by_class_name("_9AhH0")[0].click()
            point = 1
        except:
            driver.back()
            driver.execute_script("window.scrollTo(0, 0);")
            driver.find_elements_by_class_name("_9AhH0")[0].click()
            point = 1
            
#########行われない


else:
    print("スクレイピングを開始します。")

    #beautifulsoupを使う場合に、50以下の場合に保存するためのコード
    df.to_csv(additional_url + ".csv")
    point = 2

"""

video_path = "/html/body/div[3]/div[2]/div/article/div[1]/div/div/div/a"
video_url = "//img[@class='_8jZFn']"
name_path = "/html/body/div[3]/div[2]/div/article/header/div[2]/div[1]/div[1]/h2/a"
nextPagerSelector = 'a.coreSpriteRightPaginationArrow'
img_path = "//div/div/div[1]/img[@class='FFVAD']"

driver.find_elements_by_class_name("_9AhH0")[0].click()#最初の投稿をクリック
point=1 #beautifulsoupを使わない
if point == 0:#上で50投稿取れた場合
    counter = 50
else:
    counter = 1

if point != 2:#取れなかった場合
    while True:
        if counter % 1000 == 0:
            time.sleep(60)
        
        try:
            print(counter)
            time.sleep(random.uniform(int(args[2]), int(args[3])))
            url = driver.current_url#find_elements_by_xpath(img_path)[0].get_attribute('src')
            try:
                user_name = driver.find_elements_by_xpath(name_path)[0].get_attribute('title')
            except:
                user_name=None
            try:
                day = driver.find_elements_by_xpath(timepath)[0].get_attribute('datetime').split("T")[0]
            except:
                day=None
            one_article = pd.Series([day, url, user_name],["日付","画像URL","名前"])
            df = df.append(one_article, ignore_index=True)
            counter += 1
            #time.sleep(0.5)
            driver.find_element_by_css_selector(nextPagerSelector).click()
        except:
            import traceback
            traceback.print_exc()
            try:
                u=driver.find_elements_by_xpath(video_path)
                u=driver.find_element_by_css_selector(nextPagerSelector)#top画面でもvideoの表示を掴んでしまうため。
                url = driver.current_url#find_elements_by_xpath(video_url)[0].get_attribute('src')
                try:
                    user_name = driver.find_elements_by_xpath(name_path)[0].get_attribute('title')
                except:
                    user_name=None
                try:
                    day = driver.find_elements_by_xpath(timepath)[0].get_attribute('datetime').split("T")[0]
                except:
                    day = None
                one_article = pd.Series([day, url, user_name],["日付","画像URL", "名前"])
                df = df.append(one_article, ignore_index=True)
                
                counter += 1
                #time.sleep(0.5)
                driver.find_element_by_css_selector(nextPagerSelector).click()
                continue
            except:
                df.to_csv(additional_url + ".csv")
                
                import traceback
                traceback.print_exc()
                break
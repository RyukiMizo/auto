# coding: UTF-8
""" Quickstart script for InstaPy usage """

# imports
from instapy import InstaPy
from instapy import smart_run
from instapy import set_workspace
import sys
args = sys.argv
#akuseuihf
#ryumizii

# set workspace folder at desired location (default is at your home folder)
#set_workspace(path='/app/insta')

# get an InstaPy session!
session = InstaPy(username=args[1], password=args[2], multi_logs=True, headless_browser=True)

#with smart_run(session):
    #""" Activity flow """
    # general settings
session.like_by_tags(['handmade', 'ハンドメイド'], amount=4)
Jamendo Cleaner
=====================

Jamendo Cleaner is command line utility for unpack music archives you download from Jamendo.com. 

How to use
---------------------

When you downloaded all music what you want and go to folder you can see something like that:
**D:\Music\new**
* Busy_Days_-_a83642_---_Jamendo_-_MP3_VBR_192k.zip
* Catalyst_-_a111238_---_Jamendo_-_MP3_VBR_192k.zip
* Earth_Cry_to_Heaven__Single__-_a111241_---_Jamendo_-_MP3_VBR_192k.zip
* Stop_for_a_moment_-_a111240_---_Jamendo_-_MP3_VBR_192k.zip
* Une_nuit_dete_-_a111233_---_Jamendo_-_MP3_VBR_192k.zip

Er. It looks ugly, doesn't it? Open command line and run the script:

`ruby cleanjamendo.rb D:\Music\new`

It will unpuck zip files, delete archives and create folders with nice names:
**D:\Music\new**
* Busy_Days
* Catalyst
* Earth_Cry_to_Heaven__Single_
* Stop_for_a_moment
* Une_nuit_dete

That look cool! And JCleaner has one more feature. It will remove license file from music folder. Enjoy!
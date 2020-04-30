#coding=utf-8

# 将该脚本放到 embedded.mobileprovision 文件同级目录

Ipa_Cer_Name="embedded.mobileprovision"
Expiration_Date_Key="ExpirationDate"
Bundle_Id_Key="application-identifier"

def main():
	file = open(Ipa_Cer_Name,mode="r")
	lines = file.readlines()
	file.close()

	bundleId = findValue(lines,Bundle_Id_Key)
	expirationDate = findValue(lines,Expiration_Date_Key)

	bundleId = bundleId.replace("\t","").replace("\n","").replace("<string>","").replace("</string>","")
	expirationDate = expirationDate.replace("\t","").replace("\n","").replace("<date>","").replace("</date>","")

	print(expirationDate)
	print(bundleId)


def findValue(lines,key):
	isFind = False
	for l in lines:
		if isFind :
			return l
		if key in l:
			isFind = True

	return None

if __name__ == '__main__':
	main()
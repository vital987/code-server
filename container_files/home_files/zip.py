import os
import zipfile
def zip_dir(directory, zipname):
    if os.path.exists(directory):
        outZipFile = zipfile.ZipFile(zipname, 'w', zipfile.ZIP_STORED)
        rootdir = os.path.basename(directory)
        for dirpath, dirnames, filenames in os.walk(directory):
            for filename in filenames:
                filepath   = os.path.join(dirpath, filename)
                parentpath = os.path.relpath(filepath, directory)
                arcname    = os.path.join(rootdir, parentpath)
                outZipFile.write(filepath, arcname)
    outZipFile.close()

from datetime import datetime
ts=datetime.now().strftime("%d.%m.%YT%H.%M")
ts_label=ts+".zip"
dirv="/app/WORKSPACE"
ask=input(f"Archive Name[{ts_label[:-4]}]: ")
cust_label=ask.replace(" ", "_")+".zip"
os.system(f"mkdir /tmp/zips > /dev/null 2>&1")
if ask!="":
        zip_dir(dirv, cust_label)
        os.system(f"mv {cust_label} /tmp/zips")
else:
        zip_dir(dirv, ts_label)
        os.system(f"mv {ts_label} /tmp/zips")

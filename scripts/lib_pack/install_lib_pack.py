import optparse
import ftplib
import os
import subprocess

resource = {
    "macos" : [
        "ios_project_x_libs/lib_pack_mac_ios_sheltor.zip",
        "ios_project_x_libs/ffmpeg_kit_macos_universal.zip"
    ],
    "ios" : [
        "ios_project_x_libs/lib_pack_mac_ios_sheltor.zip"
    ],
    "android" : [
        "ios_project_x_libs/lib_pack_android_sheltor.zip"
    ],
    "windows" : [
        "ios_project_x_libs/lib_pack_win_squirrel.zip"
    ],
    "linux" : [
        "ios_project_x_libs/lib_pack_linux_sheltor.zip"
    ]
}

def extract_zip_preserving_symlinks(zip_path, target_dir, platform):
    if platform == "macos":
        subprocess.check_call(['ditto', '-xk', zip_path, target_dir])
    else:
        subprocess.check_call(['unzip', zip_path, '-d', target_dir])

def file_progress(chunk):
    global temp_file_downloaded
    temp_file.write(chunk)
    temp_file_downloaded += len(chunk)

# lib_pack
address = "95.217.72.40"
port = 2100
user = "mellon"
password = "K2G4vsay" 

parser = optparse.OptionParser()
parser.add_option('-p', '--platform',
    action="store", dest="query",
    help="query string", default="")

options, args = parser.parse_args()
platform = options.query

if platform != "macos" \
    and platform != "ios" \
    and platform != "android" \
    and platform != "linux" \
    and platform != "windows":
    print('no such platform: ', platform)
    exit()

ftp = ftplib.FTP_TLS()
ftp.connect(port=port,host=address)
ftp.login(passwd=password, user=user)
# switch to binary mode
ftp.sendcmd("TYPE i")

os.makedirs(os.getcwd() + "/lib_pack/" + platform, exist_ok=True)

for download_path in resource[platform]: 
    file_size = ftp.size(download_path)
    temp_file_path = os.getcwd() + "/lib_pack/" + platform + "/temp.zip"
    temp_file = open(temp_file_path, 'wb')
    cur_size = 0
    temp_file_downloaded = 0

    print("Downloading: {}".format(download_path))
    ftp.retrbinary('RETR ' + download_path, file_progress)
    temp_file.flush()
    temp_file.close()

    extract_zip_preserving_symlinks(temp_file_path, os.getcwd() + "/lib_pack/" + platform, platform)
    os.remove(temp_file_path)

print("done")
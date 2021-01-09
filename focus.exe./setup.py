import sys, subprocess


def install(package):
    subprocess.check_call([sys.executable, "-m", "pip", "install", package])

install("cx_Freeze")
install("opencv-python")
install("numpy")
install("pymsgbox")
install("requests")

from cx_Freeze import setup, Executable

build_exe_options_win = {"packages": ["cv2", "numpy", "pymsgbox", "requests"], "includes": ["threading", "time"],
                     "include_files": ["models\\"]}

build_exe_options_unix = {"packages": ["cv2", "numpy", "pymsgbox", "requests"], "includes": ["threading", "time"],
                     "include_files": ["models/"]}



if sys.platform == "win32":
    setup(  name = "Focus",
            version = "1.0",
            options = {"build_exe": build_exe_options_win},
            executables = [Executable("Focus.py", base = None, icon = "models\\app_icon.ico")])
else:
    setup(  name = "Focus",
            version = "1.0",
            options = {"build_exe": build_exe_options_unix},
            executables = [Executable("Focus.py", base = None, icon = "models/app_icon.ico")])

import cv2, threading, pymsgbox, time
import numpy as np
import requests, sys


    

def timeout():
    global total_time_afk
    global afk_count
    global id
    global room
    start_time = time.time()
    res = requests.post("http://qwerty73098.pythonanywhere.com/" + id, 
                        json ={"room" : room, "sender" : id, "time" : str(total_time_afk), 
                               "count" : str(afk_count) , "status" : "afk"})
    answer = pymsgbox.alert("Please return to view ASAP.", "Away or AFK?", button = "OK")
    if answer == "OK":
        total_time_afk += time.time() - start_time + AFK_PERIOD
        afk_count += 1
        requests.post("http://qwerty73098.pythonanywhere.com/" + id, 
                      json = {"room" : room, "sender" : id, "time" : str(total_time_afk), 
                              "count" : str(afk_count) ,"status" : "on"})
        new_timer()
        timer.start()
    
def new_timer():
    global timer
    global AFK_PERIOD
    timer = threading.Timer(AFK_PERIOD, timeout)


AFK_PERIOD = 90.0
total_time_afk = 0.0
afk_count = 0
room = pymsgbox.prompt("Enter the room number: ", "Identification - I")
if room == None:
    exit()
id = pymsgbox.prompt("Enter your student number: ", "Identification - II")
if id == None:
    exit()
start = requests.post("http://qwerty73098.pythonanywhere.com/" + id, 
                      json = {"room" : room, "sender" : id, "time" : str(total_time_afk), 
                              "count" : str(afk_count) ,"status" : "on"})
if sys.platform == "win32":
    filepath = "models\\"
else:
    filepath = "models/"
eye_cascade = cv2.CascadeClassifier(cv2.data.haarcascades +
                                    "haarcascade_eye_tree_eyeglasses.xml")
net = cv2.dnn.readNetFromCaffe(filepath + "deploy.prototxt.txt",
                                filepath + "res10_300x300_ssd_iter_140000.caffemodel")
cv2.namedWindow("Press Esc to quit")
vc = cv2.VideoCapture(0)
if vc.isOpened():
    rval, frame = vc.read()
else:
    pymsgbox.alert("No Webcam is detected")
    exit()
    rval = False

new_timer()
not_blink = present = True
frame_count = 0

while rval: 
    #Read Frame and detect faces using dnn
    rval, frame = vc.read()
    h, w = frame.shape[:2]
    blob = cv2.dnn.blobFromImage(cv2.resize(frame, (300, 300)), 1.0, (300,300),
                                (104.0, 117.0, 123.0))
    net.setInput(blob)
    faces = net.forward()
    face_count = 0
    count_this = True
    for i in range(faces.shape[2]):
        #for every face detected, get confidence level
        confidence = faces[0, 0, i, 2]
        if confidence < 0.5:
            #faces below 0.5 confidence level is not regarded as face
            continue
        face_count += 1
        #convert frame to grayscale for eye detection with HAAR eye cascade
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        box = faces[0, 0, i, 3 : 7] * np.array([w, h, w, h])
        (x, y, x1, y1) = box.astype("int")
        roi_gray = gray[y:y1, x:x1]
        roi_colour = frame[y:y1, x:x1]
        eyes = eye_cascade.detectMultiScale(roi_gray, scaleFactor = 1.1, 
                                            minNeighbors = 5, flags = 0)
        eye_count = 0
        for (ex,ey,ew,eh) in eyes:
            eye_count += 1
        if eye_count == 0:
            if count_this:
                frame_count += 1
                count_this = False
        else:
            count_this = not_blink = present = True
            frame_count = 0
            timer.cancel()
        if frame_count > 5 and not_blink and timer.is_alive() == False: 
            timer.cancel()
            new_timer()
            timer.start()
            not_blink = False
    if face_count == 0 and present and timer.is_alive() == False:
        timer.cancel()
        new_timer()
        timer.start()
        present = False
    key = cv2.waitKey(20)
    if key == 27 or cv2.getWindowProperty("Press Esc to quit", 0) == -1:
        timer.cancel()
        end = requests.post("http://qwerty73098.pythonanywhere.com/" + id, 
                            json = {"room" : room, "sender" : id, "time" : str(total_time_afk), 
                                    "count" : str(afk_count) ,"status" : "off"})     
        break
vc.release()
cv2.destroyWindow("Press Esc to quit")




   










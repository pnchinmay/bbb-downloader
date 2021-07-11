# bbb-downloader
A few scripts for downloading BigBlueButton (BBB) recordings as
videos.

BBB allows recording sessions, and will allow replaying the recordings
in its Web playback page.

For recordings made for BBB's greenlight sessions, the playback page's
URL will typically look like
`https://bbb.example.com/playback/presentation/2.0/playback.html?meetingId=375240faa7265529b58e0efe9f5fe793-b8b2b763a50993de7dfd0`

The tools provided here will work with such a URL passed in argument.

## A note about the slides and video playback

A nice feature of BBB is the fact that, to present a slides deck, you
don’t need to share your screen (as a video stream), but just have to
upload your file, which is then auto-converted to *images*, that are
sent to participants, in sync with your next/previous browsing of the
slides.

This is great for an attendance with low bandwidth, which can receive
the slides (as “static” images) without problems, instead of having to
receive a much heavier full screen video stream.

But a side effect is that the playback of a recording, is
done by replaying the slides, just as it was done live: displaying
*images* one after the other.

While it is easy to retrieve the audio, webcams of participants, or
screen sharings as video streams, which are directly available from the
playback web app, it is thus not the same for the slides, which
don’t come directly as a video.

Let's first see the easiest tool `download_bbb_data.py`, which can be used to download
everything but slides, which may be your first option.

:bulb ```This script will download the audio and video in separate file along
with the images of the slides. For the combined video with audio in mp4 format, check out the next script below```
```
$ ./download_bbb_data.py URL
```

## Downloading already available recordings

First download and install python and other required dependencies for the script:
```
sudo apt update
sudo apt install python3 python3-pip ffmpeg bc
pip3 install -r python-requirements.txt
```

To download the videos and slides which are already available to view
in the BBB playback page, simply run the script in the terminal or the script can be directly run by double-clicking the script in the file manager as shown in the demo video below.

`easydownload.sh`:
```
$ ./easydownload.sh
```
Or the script can be directly run by double-clicking the script in the file manager as shown in the demo video below.

The script downloads the following files:

- `Videos/deskshare.[webm|mp4]`: contains the video of the deskshare

- `Videos/webcam.[webm|mp4]`: contains the video of the webcam with the recorded sound track

- `Slides/`: contains the slides, downloaded as *images*

- `Thumbnails/`: contains the thumbnails

An example run of the script is shown below:

💡```This video is meant for the end-users who don't know to run scripts through terminal```


https://user-images.githubusercontent.com/62750974/125193981-e4543000-e26c-11eb-89ee-c20f5e6f9dec.mp4


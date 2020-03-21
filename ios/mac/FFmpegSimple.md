# ffmpeg 基本用法

视频拆分成图片组

`ffmpeg -i /path/to/my/video.mp4 /path/to/output/video-frame-%d.png`

一组图片组成视频

`ffmpeg -i video-frame-%0d.png -c:v libx264 -vf "fps=25,format=yuv420p" out.mp4`

视频只保留语音

`ffmpeg -i /path/to/my/video.mp4 /path/to/my/audio.mp3`
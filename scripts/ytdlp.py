import os
import yt_dlp

def run_downloader():
    """run the dowloader"""
    # 1. Setup User Inputs
    print("--- YT-DLP ADVANCED DOWNLOADER ---")
    url = input("Enter URL: ").strip()
    
    print("\nSelect Mode:")
    print("1. Video (MP4/Best)")
    print("2. Video (High-Res MOV)")
    print("3. Audio Only (MP3)")
    mode = input("Choice (1-3): ")

    is_playlist = input("Download as playlist? (y/n): ").lower() == 'y'
    tag = input("Enter Category/Tag (e.g., 'Tutorials', 'Vlogs'): ").strip() or "General"

    # 2. Configure Path Logic
    base_dir = "~/Documents/Nextcloud"
    if mode == "2":
        parent = "MOV"
        ext_format = "mov"
        ydl_format = "bestvideo+bestaudio/best"
    elif mode == "3":
        parent = "Music"
        ext_format = "mp3"
        ydl_format = "bestaudio/best"
    else:
        parent = "Videos"
        ext_format = "mp4"
        ydl_format = "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"

    # Create the path: Downloads/[MOV or Videos]/[Tag]/filename
    save_path = os.path.join(base_dir, parent, tag, "%(title)s.%(ext)s")

    # 3. YT-DLP Options
    ydl_opts = {
        'format': ydl_format,
        'outtmpl': save_path,
        'noplaylist': not is_playlist,
        'quiet': False,
    }

    # Add Post-Processors based on mode
    if mode == "2": # MOV Conversion
        ydl_opts['postprocessors'] = [{
            'key': 'FFmpegVideoConvertor',
            'preferedformat': 'mov',
        }]
    elif mode == "3": # MP3 Conversion
        ydl_opts['postprocessors'] = [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }]

    # 4. Execution
    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        try:
            ydl.download([url])
            print(f"\n✅ Success! Files saved to: {os.path.join(base_dir, parent, tag)}")
        except Exception as e:
            print(f"\n❌ Error: {e}")

if __name__ == "__main__":
    run_downloader()

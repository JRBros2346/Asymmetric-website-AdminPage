import os
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import subprocess

class ServerReloader(FileSystemEventHandler):
    def __init__(self):
        self.process = None
        self.start_server()

    def start_server(self):
        if self.process:
            self.process.terminate()
        print("Starting server...")
        # Provide the full path to your V executable here
        v_executable_path = "C:\\path\\to\\v.exe"  # Replace this with the actual path
        self.process = subprocess.Popen([v_executable_path, "run", "main.v"], shell=True)

    def on_any_event(self, event):
        if event.src_path.endswith(".v"):
            print(f"File changed: {event.src_path}")
            self.start_server()

if __name__ == "__main__":
    path = "."  # Monitor the current directory
    event_handler = ServerReloader()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

import os
import time
import shutil
import subprocess
import ipywidgets as widgets
#from IPython.display import clear_output  # ✅ this is the missing import

from IPython.display import IFrame, display, HTML, clear_output, Markdown
from ipywidgets import GridspecLayout, Button, Layout, jslink, IntText, IntSlider, interact, HBox, VBox, Output
from datetime import datetime
from pathlib import Path


# Set up command parameters
pg_dump_path = "/usr/bin/pg_dump"
output_path = "/home/roachie/LaMigra/schemas/dvdrental.sql"

def clean_directory_preserve_readme(root_path):
    for root, dirs, files in os.walk(root_path, topdown=False):
        for d in dirs:
            dir_path = os.path.join(root, d)
            try:
                shutil.rmtree(dir_path)
                print(f"Removed directory: {dir_path}")
            except Exception as e:
                print(f"Failed to remove {dir_path}: {e}")
                
        # If this is not the root directory, we skip checking files
        if root != root_path:
            continue
        # Remove all files except README.md from the root (optional)
        for f in files:
            for f in files:
                if f != "README.md":
                    file_path = os.path.join(root, f)
                    try:
                        os.remove(file_path)
                        print(f"Removed file: {file_path}")
                    except Exception as e:
                        print(f"Failed to remove {file_path}: {e}")

dd_sel_srcdb = widgets.Dropdown(
      options=['PostgreSQL', 'MySQL', 'Oracle']
    , value='PostgreSQL'
    , rows=3
    , description='Source Database \U0001F4E6:'
    , disabled=False
    , layout=widgets.Layout(width='auto')
    , style={'description_width': 'auto'}
)

input_uid = widgets.Text(
          value = ''
        , placeholder='Enter User Name:'
        , layout = { 'width': '400px', 'height': '30px'}
        , description='User Name:'
        , style = {'description_width': 'auto'}
        , disabled=False
)

input_pswd = widgets.Password(
          description='Password:'
        , value = ''
        , placeholder='Make it long!'
)

input_host = widgets.Text(
          value = ''
        , placeholder='Enter Host DSN/IP'
        , layout = { 'width': '400px', 'height': '30px'}
        , description='Enter Host \U0001F4BB:'
        , style = {'description_width': 'auto'}
        , disabled=False
)

input_port = widgets.Text(
          value = '5432'
        , placeholder='Enter Port Number'
        , layout = { 'width': '200px', 'height': '30px'}
        , description='Port Number:'
        , style = {'description_width': 'auto'}
        , disabled=False
)

progres_dsply = widgets.FloatProgress(
      value=0
    , min=0
    , max=10000.0
    , description='Objects Count:'
    , bar_style='info'
    , style={'bar_color': '#FF0000'}
    , orientation='horizontal'
)

r0 = HBox([dd_sel_srcdb])
r1 = HBox([input_uid, input_pswd])
r2 = HBox([input_host, input_port])
r3 = HBox([progres_dsply])
form_01 = VBox([r0, r1, r2, r3])


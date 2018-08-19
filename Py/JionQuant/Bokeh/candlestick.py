
from math import pi

import pandas as pd

from bokeh.plotting import figure, show, output_file
# from bokeh.sampledata.stocks import MSFT
from stocksWWY import MSFT

#----------------------------  wwy  ----------------------------
from bokeh.layouts import gridplot
import numpy as np
from bokeh.models import ColumnDataSource
from bokeh.models import CrosshairTool
from bokeh.models import HoverTool
#---------------------------------------------------------------

# wwy 数据被下载到目录 C:\Users\apple\.bokeh\data
# 见 Sample Data 一节 https://bokeh.pydata.org/en/latest/docs/installation.html

# df = pd.DataFrame(MSFT)[:500]
df = pd.DataFrame(MSFT)[-2500:]
df["date"] = pd.to_datetime(df["date"])

inc = df.close > df.open
dec = df.open > df.close
w = 12*60*60*1000 # half day in ms


# TOOLS = "pan,wheel_zoom,box_zoom,reset,save,xwheel_zoom,ywheel_zoom"
TOOLS = "pan,box_zoom,reset,save,wheel_zoom"

# wwy 修改
p = figure(x_axis_type="datetime", tools=TOOLS, plot_width=1300,
           plot_height=500, title = "MSFT Candlestick",toolbar_location="above",
           active_scroll = 'wheel_zoom')

p.background_fill_color = "whitesmoke"   # wwy
p.sizing_mode = 'scale_width'            # wwy

p.xaxis.major_label_orientation = pi/4
p.grid.grid_line_alpha=0.3

p.segment(df.date, df.high, df.date, df.low, color="black")
p.vbar(df.date[inc], w, df.open[inc], df.close[inc], fill_color="green", line_color="green")
p.vbar(df.date[dec], w, df.open[dec], df.close[dec], fill_color="#F2583E", line_color="#F2583E")

#----------------------------  wwy  ----------------------------
# def datetime(x):
#     return np.array(x, dtype=np.datetime64)

# p.line(datetime(MSFT['date']), MSFT['adj_close'], color='#FB9A99')

p.ygrid.grid_line_alpha = 0.5
p.ygrid.grid_line_dash = [1, 4]
p.ygrid.grid_line_color = None

p.xgrid.grid_line_alpha = 0.3
p.xgrid.grid_line_dash = [1, 4]
p.xgrid.grid_line_color = 'black'

# p.add_tools(CrosshairTool(line_color='black',line_alpha = 0.3,line_width=1))
#---------------------------------------------------------------

output_file("candlestick.html", title="candlestick.py example")

# p = gridplot([[p]], sizing_mode='stretch_both')  # wwy


show(p)  # open a browser
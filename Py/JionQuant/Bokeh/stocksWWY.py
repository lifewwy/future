
# wwy 修改 bokeh.sampledata.stocks

#-----------------------------------------------------------------------------
# Copyright (c) 2012 - 2017, Anaconda, Inc. All rights reserved.
#
# Powered by the Bokeh Development Team.
#
# The full license is in the file LICENSE.txt, distributed with this software.
#-----------------------------------------------------------------------------
''' Provide recorded stock data for the following stocks:

    AAPL, FB, GOOG, IBM, MSFT

Each eries is available as an attribute on the module (e.g., ``stocks.AAPL``)
and the value is a dictionary with the structure:

.. code-block:: python

    AAPL['date']       # list of date string
    AAPL['open']       # list of float
    AAPL['high']       # list of float
    AAPL['low']        # list of float
    AAPL['close']      # list of float
    AAPL['volume']     # list of int
    AAPL['adj_close']  # list of float

'''

#-----------------------------------------------------------------------------
# Boilerplate
#-----------------------------------------------------------------------------
from __future__ import absolute_import, division, print_function, unicode_literals

import logging
log = logging.getLogger(__name__)

#-----------------------------------------------------------------------------
# Imports
#-----------------------------------------------------------------------------

# Standard library imports

import csv

# External imports

# Bokeh imports

from bokeh.util.sampledata import  open_csv  # wwy

#-----------------------------------------------------------------------------
# Globals and constants
#-----------------------------------------------------------------------------

__all__ = (
    'AAPL',
    'FB',
    'GOOG',
    'IBM',
    'MSFT',
)

#-----------------------------------------------------------------------------
# General API
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Dev API
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Private API
#-----------------------------------------------------------------------------


def _read_data(name):
    '''

    '''
    # filename = external_path(name+'.csv')
    directory = 'C:\\D\\xyz\\future\\Datafeed\\eodhistoricaldata\\ForTB\\'
    filename = directory + name + '.US.csv'

    data = {
        'date' : [],
        'open' : [],
        'high' : [],
        'low' : [],
        'close' : [],

        'adj_close': [],
        'volume': [],
    }
    with open_csv(filename) as f:
        next(f)
        reader = csv.reader(f, delimiter=str(','))
        # i = 0
        for row in reader:
            date, open_price, high, low, close, adj_close, volume = row
            # print(open_price)
            # i+=1
            # print(i)
            data['date'].append(date)
            data['open'].append(float(open_price))
            data['high'].append(float(high))
            data['low'].append(float(low))
            data['close'].append(float(close))

            data['adj_close'].append(float(adj_close))
            data['volume'].append(int(volume))

    return data

#-----------------------------------------------------------------------------
# Code
#-----------------------------------------------------------------------------


MSFT = _read_data('MSFT')

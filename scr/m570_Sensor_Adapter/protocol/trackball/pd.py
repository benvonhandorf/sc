import sigrokdecode as srd
import math

class Decoder(srd.Decoder):
	api_version = 2
	id = 'm570'
	name = 'm570 protocol'
	longname = 'Logitech m570 trackball SPI protocol'
	desc = 'Logitech m570 trackball SPI protocol'
	license = 'gplv2+'
	inputs = ['spi']
	outputs = ['x', 'y']
	channels = ()
	optional_channels = ()
	annotations = (
		('x', 'X Coordinate Moves'),
		('y',	'Y Coordinate Moves')
	)

	def start(self):
		self.out_ann = self.register(srd.OUTPUT_ANN)
		self.previous_mosi = 0x00

	def decode(self, ss, es, data):
		ptype, mosi, miso = data

		if ptype != 'DATA':
			return

		if self.previous_mosi == 0x84:
			yDelta = miso
			if yDelta != 0:
				self.put(ss, es, self.out_ann, [1, ['Y:{:02X}'.format(yDelta), str(yDelta)]])
		if self.previous_mosi == 0x85:
			xDelta = miso
			if xDelta != 0:
				self.put(ss, es, self.out_ann, [0, ['X:{:02X}'.format(xDelta), str(xDelta)]])

		self.previous_mosi = mosi



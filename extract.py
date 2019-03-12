import flir
import numpy as np
import struct
import sys
from kaitaistruct import KaitaiStream
from PIL import Image, ImageFile, ImageMath

def reject_outliers(data, m = 2.):
    d = np.abs(data - np.median(data))
    mdev = np.median(d)
    s = d/(mdev if mdev else 1.)
    return data[s<m]

class FlirPMImageFile(ImageFile.ImageFile):
    format = "FlirPM"
    format_description = "FLIR PM-series camera IMG format"

    def _open(self):
        f = flir.Flir(KaitaiStream(self.fp))
        self.f = f

        self.size = f.metadata.width, f.metadata.height
        self.mode = "F"

        self.tile = [
            ("raw", (0, 0) + self.size, 0x438, ('F;16B', 0, 1)),
        ]

        data = reject_outliers(np.array(f.imagedata.data), 10.)

        self.min = min(data)
        self.max = max(data)

if len(sys.argv) < 3:
    print("Usage: {} <input.img> <output>".format(sys.argv[0]))
    sys.exit()

Image.register_open("FlirPM", FlirPMImageFile)
Image.register_extension("FlirPM", ".IMG")

im = Image.open(sys.argv[1])
im = ImageMath.eval("convert((a-{})*{}, 'L')".format(im.min, 256.0/(im.max-im.min)), a=im)
im.save(sys.argv[2])

import flir
import struct
import sys
from kaitaistruct import KaitaiStream

def clamp(x):
    return min(max(0, int(x)), 65535)

x = flir.Flir(KaitaiStream(open(sys.argv[1], 'rb')))
data = list(map(lambda x: clamp((x-32000)*60), x.imagedata.data))
sys.stdout.buffer.write(struct.pack('H'*len(data), *data))

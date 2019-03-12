meta:
  id: flir
  file-extension: flir
  encoding: ASCII
  endian: be
seq:
  - id: header
    type: header
    size: 0x200
  - id: metadata
    type: metadata
    size: 0x238
  - id: imagedata
    type: imagedata
types:
  header:
    seq:
      - id: magic
        type: strz
  metadata:
    seq:
      - id: unk0
        type: u2
      - id: width
        type: u2
      - id: height
        type: u2
      - id: unk1
        type: u2
      - id: unk2
        type: u2
      - id: unk3
        type: u2
      - id: width2
        type: u2
      - id: unk5
        type: u2
      - id: height2
        type: u2
      - id: unk6
        type: u2
      - id: unk7
        type: u2
      - id: width_options
        type: u2
        repeat: expr
        repeat-expr: 6
      - id: height_options
        type: u2
        repeat: expr
        repeat-expr: 5
      - id: pallette1
        type: u2
        repeat: expr
        repeat-expr: 17
      - id: pallette2
        type: u2
        repeat: expr
        repeat-expr: 17
      - id: model
        type: str
        size: 21
      - id: partno
        type: str
        size: 10
      - id: serial
        type: str
        size: 10
      - id: fov
        type: str
        size: 11
      - id: unkstr0
        type: str
        size: 24
      - id: unkstr1
        type: str
        size: 11
      - id: unkstr2
        type: str
        size: 10
      - id: unkstr3
        type: str
        size: 15
      - id: calibration
        type: str
        size: 16
      - id: version
        type: str
        size: 4
      - id: date
        type: str
        size: 16
      - id: unk12
        type: u2
      - id: unk13
        type: u2
      - id: unk14
        type: u2
      - id: unk15
        type: u2
      - id: unk16
        type: u2
      - id: unk17
        type: u2
      - id: unk18
        type: u2
      - id: unk19
        type: u2
      - id: unk20
        type: u2
      - id: unk21
        type: u2
      - id: unk22
        type: u2
      - id: unk23
        type: u2
      - id: unk24
        type: u2
      - id: unk25
        type: u2
      - id: unk26
        type: u2
      - id: unk27
        type: u2
      - id: unk28
        type: u2
      - id: unk29
        type: u2
      - id: unk30
        type: u2
      - id: unk31
        type: u2
      - id: unk32
        type: u2
      - id: unk33
        type: u2
  imagedata:
    seq:
      - id: data
        type: u2
        repeat: eos
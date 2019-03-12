# flir-pm-img
Extract image data from FLIR PM-series IMG files

## Prereqs

 * kaitai-struct-compiler
 * python3-pil
 
## Build
Generate parser code in `flir.py` with `kaitai-struct-compiler`:

    kaitai-struct-compiler -no-version-check flir-pm.ksy -t python
    
## Usage

    python3 extract.py <input.img> <output>

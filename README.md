TCD (v1.3)
=========

This is a toy demo for the unsupervised Temporal Commonality Discovery (TCD) using a branch and bound approach.

- **Links**: [paper](https://www.ri.cmu.edu/pub_files/2012/10/tcd_final.pdf) | [poster](http://ochoa.pc.cs.cmu.edu/wschu/papers/doc/eccv10-tcd-poster-low.pdf) |  [slides](http://ochoa.pc.cs.cmu.edu/wschu/papers/doc/eccv12-tcd.pptx)
- **Contact**:  Please send comments to Wen-Sheng Chu (wschu@cmu.edu)  
- **Citation**: If you use this code in your paper, please cite:
```
@inproceedings{chu2012unsupervised,
    title={Unsupervised temporal commonality discovery},
    author={Chu, Wen-Sheng and Zhou, Feng and {De la Torre}, Fernando},
    booktitle={ECCV},
    year={2012}
}
```


Contents
========

The project tree is organized as follows.

    lib/            directory for utility functions
    src/            directory for our c++ implementation of TCD algo
    README.md       this file
    demoTCD.m       demo of TCD on discovering temporal commonalities among two sequences 

Usage
=====

In Matlab shell:

    >> cd tcd_v1.3
    >> make
    >> addpaths
    >> demoTCD

You may want to change pickEx in the script to play with other examples.

The script has been tested on Windows 8, Ubuntu 3.11.0 and Mac X 10.9.4 without problems. 
Please send your feedbacks to [Wen-Sheng Chu](mailto:wschu@cmu.edu) regarding any issues, bugs and improvements. 

Change Log
==========

**Aug-08-2014**
    *    Implemented the main TCD routine in C++
    *    The speedup against v1.2 is fascinating and can be found [here](http://humansensing.cs.cmu.edu/wschu/project_tcd.html#FIG_SPEEDUP)

**Jan-06-2013**

    *    Extend TCD with soft clustering and hard clustering
    *    Speedup TCD search using integral image
    *    Speedup multiple TCD search using queue elimination

**Oct-06-2012**

    *    Add the main implementation of the TCD algorithm
    *    Add comparisons to the naive SW approach
    *    Add a demo for 8 synthetic examples, including detecting multiple commonalities and an application to video indexing

License
=======

The code may be redistributed under BSD license.
Please send your feedbacks to [Wen-Sheng Chu](mailto:wschu@cmu.edu). :)



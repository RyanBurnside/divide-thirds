# divide-thirds
This is a very simple Gimp Script-Fu script to divide a canvas quickly into thirds

* Gimp 2.10

  The file `divide-thirds.scm` should be placed in your scripts folder 
  in your Gimp directory. This may differ by OS so check with your installation.

  For me on Linux it's `~/.config/GIMP/2.10/scripts/`

* Gimp 3.0/3.2
 
  You need to copy the whole `divide-thirds-v3` directory to your
  Gimp plug-ins directory. This may differ by OS so check with your installation.
  
  For me on Linux it's `~/.config/GIMP/3.x/plug-ins/`
  
  Mare sure that the `locale` directory was copied (even if empty) and that the 
  `divide-thirds-v3.scm` file is executable. 

  Both are requirements for any plug-in in Gimp 3.x.


Doing any of the above, regardless of the Gimp version, will add a new option
to the Script-Fu menu in Gimp.

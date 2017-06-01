from __future__ import print_function
import os

def runMaxent(jarloc, envloc, occloc, outloc, outfrm, outtyp, args=[]):

    myCommand = "java -mx512m -jar \"" + jarloc + "\" -e \"" + envloc + "\""
    myCommand += " -s \"" + occloc + "\" -o \"" + outloc + "\""
    myCommand += " outputformat=" + outfrm.lower() + " outputfiletype=" + outtyp.lower()

    for arg in args:
        myCommand += arg
    myCommand += ' -a'

    # get name of species from input file
    species = os.path.basename(occloc).split('.')[0]

    # create a folder for each species
    newout = os.path.join(outloc, species)
    if os.path.isdir(newout):
        print("Directory " + newout + " already exists.")
        return
    else:
        print("Creating new directory " + newout + ".")
        os.mkdir(newout)

    # execute the command
    result = os.system(myCommand)

    if result == 0:
        print("Complete.")
    else:
        print("Error running Maxent.")

runMaxent(jarloc='/Users/tanuki/Science/maxent/maxent.jar',
          envloc='/Users/tanuki/Downloads/DIVA_tutorial/modified_from_Graham/coverages/Ec_bioc/bio_2.asc',
          occloc='/Users/tanuki/Downloads/DIVA_tutorial/modified_from_Graham/occurrence_records/Grallaria_quitensis.csv',
          outloc='/Users/tanuki/Downloads/DIVA_tutorial/modified_from_Graham/occurrence_records',
          outfrm='logistic',
          outtyp='asc')

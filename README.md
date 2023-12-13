Matlab Code:

Load Data
	Imports our custom motor data (from 4Q graph) 
	Imports standard (noraml GEM motor) data, 
	Imports standard points linear interpolated to our custom motor operating points (only used in visualizing in point cloud not in any actual analysis)
	Imports solaride normal and solaride regen data
	Sets ASC and FSGP crusing targets (based on Liams data)
	Imports comparable conditions (the rpm's/torques of the custom motors that fall within the range of torques/rpm's we also have for standard) and their associated efficiency's of the custom data

CreatePointCloudPlot

	Creates the point cloud plot showing all imported data 

addToFigure

	Function to take a nx3 matrix of rpm, torque and efficiency columns and plot it

addPlaneToFigure

	Function to take a shift and plot that shift to the effieincy equations as a plane

gridFit

	Function I found online to generate a plane based on linear interpolation (only used in visualziing not in analysis)

StandardPlaneFit

	Commented out code to call curveFitter tool box. Uncomment it to perform your own fitting.
	Runs polynomial55fitGreaterThan100 and polynomial55fitGreaterThan100SignificantParameters to create two fitresult objects

polynomial55fitGreaterThan100

	Auto generated function by MATLAB based on me fitting standard data in curveFitter
	Will create a plot showing efficiency as contour lines on torque and rpm, the plane fit and residuals between the plane and standard data
	Code slightly modified by me just for visualization

polynomial55fitGreaterThan100SignificantParameters

	Auto generated function by MATLAB based on me fitting standard data in curveFitter with me constraining some parameters to 0
	I selected the parameters to constrain based off if I couldn't say that they were significant with 95% confidence (if the 95% confidence bound for each point intercepted 0 then not significant)
	Will create a plot showing efficiency as contour lines on torque and rpm, the plane fit and residuals between the plane and standard data

CompareValues
	Determines the differences between the custom comparable efficiency points and the standard fit plane.
	Determines mean differences, standard deviation and upper/lower bounds at 1 sd confidence
	Determines residuals (custom data efficiency - custom data plane efficiency) based on no shift, mean shift and lower bounds shift of the standard plane
	Plots 3 planes (no shift, mean shift and lower bounds shifts and their respective residuals

Efficiency Equation

	The result of fitresult1 (standard data fit) where I took the equation it gave and actually coded it
	Normalized the rpm and torque then applied equation
	Added a shift
	Returns the efficiency 

shiftedFit

	Auto generated function by MATLAB based on me fitting standard data shifted and the custom data in curveFitter
	Will create a plot showing efficiency as contour lines on torque and rpm, the plane fit and residuals between the plane and standard data
	Code slightly modified by me just for visualization

ShiftAndFitAllData

   Comines shifted standard data (by the mean difference) with the custom motor data. Assigns 10x weight to the custom data and fits the combined data
   Outputs the coefficients to a table

To Run:

	You will need to install the curveFitter toolbox
	
 	Run LoadData to import everything into the workspace
	Run CreatePointCloudPlot to see the general point cloud
	Run StandardPlaneFit to see the first figure of a plane fit and second figure of a plane fit with insignificant parameters removed
	Run CompareValues to see the plane fit then shifted to the custom data
	Run ShiftAndFitAllData to see the shifted data then combined with the custom data and fitted to a plane.

 	Vairables fitresult1, gof1 will show all of the information for the plane and some goodness of fit statistics for first plane
	Vairables fitresult2, gof2 will show all of the information for the plane and some goodness of fit statistics for first plane with insignificant parameters removed
 	Variables shiftedFit,shiftedGof and CoefficientTable with all information of the combined plane

Other stuff:
	All the plane polynomial fitting is done through curveFitter. You can essentially just call that and then follow it to try fitting data
	All my outlier detection was done visually based on curveFitter and residual plots
	In my fitresults, I exlcluded rpm <= 50 as I found it increasing the residuals by a bit in the 200-1000rpm range which I did not think was ideal

	

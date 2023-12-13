#Fitting efficiency data procedure:

Conducted by Dylan Conley

Scope: To express an equation of motor efficiency in terms of rpm and torque to determine motor efficiency of the custom motors.

##The data:
	Custom motor values read off of 4 Quadrant Graph. These values are considered as the 'truth' and operate under our ideal conditions of our custom 2.6 motor and 65V
	General Efficiency values from GEM motors for a 48V GEM 2.6 Standard Motor
	Custom efficiency values provided by team Solaride for their 65V GEM 1.3 Custom motors
	Custom efficiency regen values provided by team Solaride for their 65V GEM 1.3 Custom motors

##What was done:
	The data was visualized in MATLAB as a 3D point cloud.
	It was discussed by Dylan, Jenny, Billy and Liam that a linear shift could be applied to the standard data to fit our custom motors.
	
	A standard plane with no shift was then fit under matlab file StandardPlaneFit.m
		This was a 5th degree polynomial with normalized input data and is expressed in EfficiencyEquation.m
	
	A significance of parameters test was then performed at 95% confidence and parameters not deemed as significant were removed. It was determined that this made too much of an impact on the graph and signficance of parameter testing was not continued in the rest of this analysis.
	
  A plane for the Solaride normal data was also fit via command line prompts.
		This was also a 5th degree polynomial with normalized input data
	A statististical test with 95% confidence was performed and it was determined that 13/21 parameters were statistically identical between both planes.
	Using a mix/mean of parameters in fitting the standard plane was attempted but it was unsuccessful and not continued with.

	Using the initial standard plane, the average difference (4.6855%) and the standard devaition (2.0480%) of it between the plane and the custom data points that operated under similar motor operating points was created.
	The standard plane was then shifted by the average difference, no difference and average difference less the standard deviation (aka. lower bound) and visualized
	A plot of residuals were generated comparing the plane fit to the custom motor points for each shift
	It was determined that the best shift was the average difference.

	Following the determination of the shift, all of standard efficiency data was shifted. This was combined with the custom data and a plane was fit to the mix of the data. The custom data was assigned a weight 10x of the standard shifted data due to it being considered the most accurate. The 10x shift is rather arbitrarty and other values could be explored further.
		Based on this data, an iterative robust least squares fit was used. 
		The x-y intercept was set to 0 based on some research that the efficiency is 0 at 0 rpm and torque
		This created a better fit that signficiacntly reduced the sum square of the residuals
		Including outlier operating conditions that significantly increased the error, the adjustment was completed with a RMSE of 2.5% which I would consider excellent based on the noise and lack of pattern in some of the parts of the figure
		Looking only at the custom motor data and excluding a point operating at almost 0 rpm, the RMSE was 1.7% which is again a strong fit

	This data was visualized with the outputs being a contour graph, 3d plane fit and plot of the residuals. The custom motor data is highlighted as white in these grpahs.
	The equation was then outputted to a csv table as a list of the coefficients.

	One other thing considered is the difference between regen and normal efficiency. This could be easily visualized in the solaride data with there being extremely small differences at low torque and larger differences (visually looking around/up 5-10%) at extremely high torques. Especially considering the almost exact match in the bulk of the operating ranges, no specific calculations were made. Given a 2.5% RMSE error, any adjustment applied for the regen would likely be statistically insignificant.

#End Conlusions
	A 5th degree, 20 term polynomial was determined for efficiency as a function of rpm and torque for the custom GEM 2.6 motors our team owns.
	This was done by fitting standard data, finding the mean shift to the custom data and then refitting the data using the custom data and the standard data shifted.
	This equation is valid for normal and regenrative operation. It is bounded by the extreme limits of the torque and speed data that can be seen in the 4Q graph.

	RMSE errors of 2.5% overall and 1.7% in the custom data only are excellent indicators

	The solaride data matched the standard data for 13/21 plane parameters using normalized data but a complete match between them could not be completed.
	Parameter signficance testing was also explored but unsuccessful in simplying the equation without impacting the plane.
	

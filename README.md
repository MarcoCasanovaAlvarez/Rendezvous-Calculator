Simple functions which can be used for study required maneuvers to perform rendezvous of two spacecrafts. The code is separated in two scripts:
- CoorbitalRendezvous for studying the maneuvers needed for a case where both vehicles have the same radius orbit.
- CoplanarRendezvous for studying the maneuvers needed when both vehicles are in the same orbital plane but with a different radius.

In this version, DeltaV is calculated for a maneuver performed with CP (chemical propulsion) but it is feasible to use the code for a EP (electrical maneuver) where the DeltaV is applied during all the maneuver. To perform calculations for EP is needed to correct the TOF of the maneuver,

This scrips allows to calculate the wait times and deltaV needed to adquire a especific position for a given time and also allows to study trade-offs such as wait time vs deltaV for a Coplanar Rendezvous.

Calculations are based on:
- FAA, "Maneuvering In Space".(https://www.faa.gov/about/office_org/headquarters_offices/avs/offices/aam/cami/library/online_libraries/aerospace_medicine/tutorial/media/III.4.1.5_Maneuvering_in_Space.pdf)
- Bate, Roger R., Donald D. Mueller, Jerry E. White., "Fundamentals of Astrodynamics", 1971.
- Escobal, Pedro R., "Methods of Orbit Determination", 1976.
- Kaplan, Marshall H., "Modern Spacecraft Dynamics and Control", 1976.
- Vallado, David A., "Fundamentals of Astrodynamics and Applications", 1997.

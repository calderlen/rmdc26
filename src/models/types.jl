#=
This file hosts the abstract types. The concrete subtypes are defined in the relevant files in /models, and the functions will dispatch on those.

- LensGeometry:
	- mass configuration
	- concrete subtypes (defined in lens_geometry.jl):
		1. SingleLensGeometry
		2. BinaryLensGeometry
		3. TripleLensGeometry
		4. NLensGeometry
- SourceModel:
	- source morphology, surface brightness model
	- concrete subtypes (defined in source_model.jl):
		1. PointSource
		2. FiniteSource
		3. LimbDarkenedSource
- Trajectory:
	- relative motion of source wrt lens
	- concrete subtypes (defined in trajectory.jl):
		1. RectilinearTrajectory
		2. ParallaxTrajectory
		4. XallarapTrajectory
- LensMotion:
	- motion of lens itself
	- concrete subtypes (defined in lens_motion.jl):
		1. StaticLensMotion
		2. OrbitalMotion
- Photometry:
	- conversion of magnification to observed W149/Z087/K213 fluxes
	- concrete subtypes (defined in photometry.jl):
- Magnification:
	- method for computing magnification
	- concrete subtypes (defined in magnification.jl):
		1. PointLensAnalytic
		2. BinaryLensRootSolver
		3. TripleLensRootSolver
		4. ContourIntegration
		5. RayShooting
=#

# physics
abstract type LensGeometry end
abstract type SourceModel end
abstract type Trajectory end
abstract type LensMotion end
# observation
abstract type Photometry end
# computation
abstract type Magnification end

# this is the main abstract type for the microlensing event model -- it will pull in the physics, observation, and computation models together
abstract type MicrolensModel end


# this struct is the parent abstract type for the physical setup of the lensing model -- it's a subtype of MicrolensModel
struct MicrolensEvent{L<:LensGeometry, S<:SourceModel, T<:Trajectory, M<:LensMotion}<:MicrolensModel
	lens::L
	source::S
	trajectory::T
	lens_motion::M
end

struct ObservedMicrolensModel{E<:MicrolensEvent, P<:Photometry}<:MicrolensModel
    event::E
    photometry::P
end
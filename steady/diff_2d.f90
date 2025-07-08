
program diffusion
implicit none
integer,parameter :: npoints = 51
real(8), parameter :: L_domsize = 1.0d0
real(8), parameter :: error_req = 1.0d-6
real(8) :: h, error_mag, diff
integer :: i, j, iteration
real(8), dimension(npoints, npoints) :: T

! Grid spacing
h = L_domsize / real(npoints - 1)

! Initialize the domain T
T = 0.0d0
! Boundary condition: bottom edge (T=1) is set to 1
T(1, :) = 1.0d0

! Iterative solver (Gauss-Seidel)
error_mag = 1.0d0
iteration = 0

do while (error_mag > error_req)
error_mag = 0.0d0

 do i = 2, npoints - 1
 do j = 2, npoints - 1
  diff = T(i,j)
  T(i,j) = 0.25d0 * (T(i-1,j) + T(i+1,j) + T(i,j-1) + T(i,j+1))
  error_mag = error_mag + abs(T(i,j) - diff)
 end do
 end do

 iteration = iteration + 1
end do
print *, 'Gauss-Seidel converged after ', iteration, ' iterations.'

!Dump out the solution to a file for plotting purposes
open(unit=11, file='solution.dat', status='replace')
do i = 1, npoints
 do j = 1, npoints
  write(11,'(3F12.6)') (j-1)*h, 1.0d0 - (i-1)*h, T(i,j)
 end do
write(11,*)
end do
close(11)

print *, 'Solution written to solution_gs.dat'

end program

UWHear_breath/a_202.m contains the file I showed you today in MATLAB

Setting the Frame Area
In many applications it is not necessary, or even not desired, to look at the whole radar frame of
9.9 meters. In these cases, it's possible to reduce the amount of data to handle by setting a
smaller frame area. The method x4driver_set_frame_area(...) takes two arguments to set the start
and the end of the frame in meters. Use x4driver_get_frame_area(...) to read actual settings.
Before setting the frame area, a 0-meter reference must be set. This reference is hardware
dependent. X4M02 and X4M03 has an offset of 0.18 meters. Use the method
x4driver_set_frame_area_offset(...) to set the offset reference.

Theoretical function:
target_bin = (distance - 0.3 - 0.18)/0.0514 + 1
each bin is 0.0514m

My sensing theory: https://dl.acm.org/doi/10.1145/3384419.3430772
UWHear: through-wall extraction and separation of audio vibrations using wireless signals

Theory of using phase of I/Q signals: https://dl.acm.org/doi/pdf/10.1145/3535508.3545554
DeepVS: A Deep Learning Approach For RF-based Vital Signs Sensing

phase(COMLEX_NUMBER) = arctan + unwrap
real(COMLEX_NUMBER)
imag(COMLEX_NUMBER)
mesh(abs(X)

FFT(DFT): discrete Fourier transform





